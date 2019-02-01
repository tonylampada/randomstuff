# no gitlab, vai dentro de /var/opt/gitlab/git-data/repositories/buser/<projeto>.git/custom_hooks/pre-receive.d/

#!/bin/bash

REGEX='^@[0-9]+ .*$'

while read OLD_VALUE NEW_VALUE REFNAME ; do
  if [ "$OLD_VALUE" -eq 0 ]; then
    revs=$(git rev-list $(git for-each-ref --format='%(refname)' refs/heads/* | grep -v $REFNAME | sed 's/^/\^/') $NEW_VALUE)
  else
    revs=$(git rev-list $OLD_VALUE..$NEW_VALUE)
  fi
  for rev in $revs; do
    msg=$(git cat-file commit $rev | sed '1,/^$/d')
    echo $msg | egrep -q "$REGEX"
    checkstatus=$?
    if [ $checkstatus -gt 0 ]; then
       echo "-----------------------------------------"
       echo "Lamento. A mensagem do commit deve ter o numero da issue (card)"
       echo exemplo: \"@427 - Corrigido o bug da tela do motorista\"
       echo ""
       echo commit mau: $rev - $msg
       echo "-----------------------------------------"
       exit 1
    fi
  done
done
exit 0

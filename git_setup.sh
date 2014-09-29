alias qcurrbranch='git rev-parse --abbrev-ref HEAD'
f_qsetup() {
    git branch master --quiet --set-upstream-to origin/master
    git config branch.autosetuprebase always
    git config branch.master.rebase true
    git config branch.$(qcurrbranch).rebase true
}
alias qsetup=f_qsetup
alias qpull='qsetup && git pull --rebase origin $(qcurrbranch)'
alias qpush='qsetup && git push origin $(qcurrbranch)'
f_qmerge() {
    if [ $1 ]
    then
        thatbranch=$1
        thisbranch=$(qcurrbranch)
        git merge --no-ff -m "Fazendo merge da $thatbranch em $thisbranch [$2]" $thatbranch
    else
        echo 'Faz merge de outra branch na branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qmerge <other_branch> [commit_msg]'
    fi
}
alias qmerge=f_qmerge
f_qfeaturebranch() {
    if [ $1 ]
    then
        newbranch=$1
        git checkout -b $newbranch
        qsetup
    else
        echo 'Cria uma feature branch a partir da branch atual'
        echo '-----------------------------------------'
        echo 'Usage: qfeaturebranch <new_branch>'
    fi
}
alias qfeaturebranch=f_qfeaturebranch

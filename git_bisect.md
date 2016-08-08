

Para encontrar o commit em que um bug foi introduzido vc pode usar uma ferramenta do git chamada bisect.

Antes de começar a usar o bisect precisamos encontrar um commit em que o bug não acontecia e um commit em que o bug acontece. Depois disso é só fazer:

```bash
git bisect start
git bisect good commit_bom
git bisect bad commit_ruim
```

A partir disso o git vai fazer uma busca binária e fazer checkout para outro commit. Nesse novo commit iremos dizer pro git se o bug ainda ocorre ou não com:

`git bisect good` ou `git bisect bad`

Daí em diante o git vai fazer checkout para outro commit e faremos novamente:

`git bisect good` ou `git bisect bad`

Iremos repetir esse passo até que o git informe o commit que introduziu o bug.

Esse processo manual pode ser cansativo se existirem muitos commits. Podemos automatizar esse processo criando um script que reproduz o bug e retorna status 0 se o bug não acontece ou status diferente de 0 se o bug acontece.


git bisect run "comando que retorna 0 ou 1"

O git vai automaticamente fazer checkout para um próximo commit e executar o script até identificar em qual commit o bug começou a ocorrer.

Quando encontrar o commit, vc pode digitar o comando `git bisect reset` pra sair do "modo bisect".

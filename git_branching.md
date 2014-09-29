# 1. Introdução
Esse documento explica pro desenvolvedor como e onde fazer commits, merges, etc.

Isso tb acaba deixando claro como funciona um pedaço do nosso processo de desenvolvimento.

Mas antes, vamos só ver algumas dicas pra melhorar o seu ambiente no que diz respeito a git :smile:

### 1.1 Dicas pra um git mais profissa:
Antes de mais nada, certifique-se que vc tem o git na versão **1.8 ou superior**.

```
# Qual a minha versao do git?
git --version
```


#### git cola (disponível apenas no ubuntu)

```
# instalacao
sudo apt-get install git-cola
```

Digitar "git cola" na linha de comando abre uma interface mais amigável pra criar commits


#### gitk (já vem por padrao com git, inclusive no windows)

Digitar "gitk" na linha de comando abre uma janela com a história de commits.


#### gitg (disponível apenas no ubuntu)

```
# instalacao
sudo apt-get install gitg
```

Um gitk mais bonitinho.


#### git lg (funciona no windows/git-bash tb)

Vc pode criar um "alias" no git pra criar um comando que mostra a arvore de commits na linha de comando:

```
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

E depois pra ver um git log bonitão é só digitar

```
git lg
```


#### prompt bizurado (acho que funciona no windows/git-bash tb)

Vc pode ter um prompt que além de bonitão, mostre a branch atual.
Pra isso vc precisa editar o arquivo ~/.bashrc e adicionar o seguinte:

```
export PS1="\n\[\033[1;30m\][$$:$PPID - \j:\!\[\033[1;30m\]]\[\033[0;36m\] \T \
\[\033[1;30m\][\[\033[1;34m\]\u@\H\[\033[1;30m\]:\[\033[0;37m\]${SSH_TTY:-o} \
\[\033[0;32m\]+${SHLVL}\[\033[1;30m\]] \[\033[1;37m\]\w\[\033[0;37m\]\[\033[1;34m\]\$(__git_ps1 \" (%s)\") \[\033[0;37m\] \n\$ "
```

Depois é só reiniciar o seu terminal ou git-bash.


#### tig (no windows, só com cygwin)

http://blogs.atlassian.com/2013/05/git-tig/

# 2. As regras do processo:
* Todo mundo desenvolve na branch dev
* Funcionalidades novas devem ser desenvolvidas com feature hiding
* Pull deve ser feito sempre com --rebase (ver qpull a seguir)
* Integrações com outra branch devem ser sempre feitas com merge --no-ff (ver qmerge)
  * Uma consequencia disso: vc nunca faz git pull de outra branch
* Antes de um novo deploy, é criada uma branch homolog<n> a partir da dev, onde <n> é o número do deploy (fixVersion no JIRA)
  * Essa branch serve pra "congelar dev" e resolver os bugs que surgem durante a homologação, enquanto isso o desenvolvimento na * dev segue normalmente.
  * Bugfixes homolog devem ser jogados pra dev o mais rapido possivel
* Quando homolog tiver ok, é feito um merge homolog --> master e é feito um deploy em prod

# 3. As exceções
As regras abaixo podem ser "dobradas" um pouco dependendo do caso, sujeito ao bom senso dos programadores analisando caso a caso.

Os casos típicos são:

### 3.1 Homologação em dev
Quando não tem nada novo sendo desenvolvido em paralelo com as coisas que precisam ser estabilizadas pra entrar em prod.
Ou seja, na situação em que empresa toda está trabalhando pra estabilizar a dev.

Nesse caso, não tem problema "skipar" a branch homolog. Ou seja, faz os deploys e bugfixes direto em dev. Depois faz um merge da dev na master.

Quando o nosso codigo tiver bom o suficiente (ou seja, a gente tiver uma certeza boa que as coisas nao quebram "do nada"), essa exceção deve acabar virando regra. Mas isso ainda é um ideal distante.

### 3.2 Hotfix
Mudanças simples e rápidas que podem ser feitas direto na branch master sem passar pelo processo de homologação

### 3.3 Feature branch
As vezes acontece de um programador iniciar uma tarefa que deixaria a branch dev instavel temporariamente e atrapalharia o resto do time.

Nessa caso, o programador pode criar uma feature branch e desenvolver nela.

Durante o desenvolvimento, é importante fazer merges frequentes com dev, pra evitar surpresas (conflitos), 
lembrando sempre que: 

* "Integrações com outra branch devem ser sempre feitas com merge --no-ff (ver qmerge)"
* "vc nunca faz git pull de outra branch"

Então:

```
git fetch && qmerge origin/dev
```

Quando seu código tiver bom, então vc joga ele em dev:

```
git checkout dev
qpull
qmerge minha_feature_branch
qpush
```

E apaga a feature branch (local e remota):

```
git branch -D minha_feature_branch
git push origin :minha_feature_branch
```
### 3.4 Atenção: não faça qpull em cima de merge!

Ou seja, não é pra fazer isso:

```shell
git checkout dev
qpull
qmerge minha_feature_branch
qpull # qpull em cima de merge = NAO
qpush
```

**Por quê?**

Porque o qpull faz pull com rebase. Fazer rebase com um commit de merge faz o git se atrapalhar e cria conflitos duplicados, e dá muito mais trabalho. O problema é que existe a possibilidade que alguém faça commits na dev enquanto vc está resolvendo conflitos localmente com a sua feature branch. E aí?

Aí faz isso:

```
git checkout dev
qpull
qmerge minha_feature_branch
qpush
# PAU - tem commits novos em dev!
git pull origin dev # Faz um pull normal. Sem rebase. Vai criar uma bolhinha de merge. Sem problema.
qpush # aih sim
```

# 4. Ferramentas
Todo mundo sabe que o git é meio difícil e todo mundo as vezes se atrapalha com ele.
Por isso criamos alguns scripts e hooks pra tentar facilitar a vida.

### 4.1 Setup inicial
Criar os aliases qpull qpush qmerge qfeaturebranch

Roda o seguinte (tem q estar na branch master)

```
cd aulasdovaca
cat ci/git-setup.sh >> ~/.bashrc
. ci/git-setup.sh
qsetup
```

Criar o hook que diz a branch onde foi criado um commit

```
cp ci/prepare-commit-msg .git/hooks/prepare-commit-msg
```

Criar o hook que te lembra de fazer merge em dev

```
cp ci/pre-push .git/hooks/
sudo chmod +x .git/hooks/pre-push
```

### 4.2 Como usar:
Esse setup inicial acima cria "aliases" (ou seja: novos comandos na sua linha de comando linux - ou gitbash/cygwin) que facilitam a vida.
Esses comandos são os seguintes:


#### **qsetup:**

Configura seu repositorio pra fazer sempre pull com rebase e garante que suas branches dev e master estão no lugar certo.
Basta rodar isso uma vez na vida.


#### **qpull:**

Faz um pull da sua branch atual, sempre com rebase. 
Ao invés de fazer um "git pull origin dev", acostume-se a fazer somente "qpull"


#### **qpush:**
Faz push da sua branch atual.
Ao invés de fazer um "git push origin dev", acostume-se a fazer somente "qpush"


#### **qmerge:**
Faz merge de alguma branch na sua branch atual.
Rodar "qmerge" sem parâmetros mostra um mini-help.
Exemplo: supondo que estou na branch dev e quero pegar alguns hotfixes que estão na master:

```
git checkout master
qpull
git checkout dev
qmerge master 'mensagem de commit opcional'
```

ou então simplesmente:

```
git fetch
qmerge origin/master
```


#### **qfeaturebranch:**
Cria uma nova feature branch.


Suponha que vc quer criar uma feature branch a partir da dev:

```
qfeaturebranch minha_nova_feature_muito_louca
# codifica/comita
qpush
```

e não esqueça de estar sempre pegando os commits de dev pra nao dar conflito depois

```
git fetch
qmerge origin/dev
```

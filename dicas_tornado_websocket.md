Hoje o Ed me deu umas dicas preciosíssimas sobre manter no ar um serviço de websocket com tornado.
Tô salvando aqui pq tem uma chance bem alta de isso ser útil no futuro (pra mim ou pra alguma outra pobre alma)

----------------------

> [13:09, 05/03/2020] Edmundo: Tony, tudo blz? Vc está usando servidor de websockets? Acabei de corrigir um monte de problemas nele que não eram tão fáceis de descobrir, se quiser umas dicas.
> [13:13, 05/03/2020] Tony Lâmpada: Ainda não, mas bom saber
> [13:14, 05/03/2020] Edmundo: Cara, ninguém fala isso nos tutoriais do tornado
> [13:14, 05/03/2020] Edmundo: Foi foda
> [13:14, 05/03/2020] Tony Lâmpada: A hora que precisar eu já sei pra quem pedir rs
> [13:14, 05/03/2020] Edmundo: Vou te passar a dica logo então
> [13:15, 05/03/2020] Edmundo: Todo processo no ubuntu tem um limite de arquivos que podem ser abertos determinado pelo sistema operacional
> [13:15, 05/03/2020] Tony Lâmpada: opa, mandae, agradeço de ❤ 🙂
> [13:15, 05/03/2020] Edmundo: esse limite normalmente é 1024
> [13:15, 05/03/2020] Edmundo: Quando o tornado cria uma conexão via websocket
> [13:16, 05/03/2020] Edmundo: ele cria um arquivo sock
> [13:16, 05/03/2020] Edmundo: então dá pra ver que ele pode precisar criar muitos arquivos
> [13:16, 05/03/2020] Edmundo: aí, depois de fuçar os logs
> [13:16, 05/03/2020] Edmundo: vc descobre isso e vai pesquisar como mudar esse limite
> [13:16, 05/03/2020] Edmundo: só que mesmo assim não funciona
> [13:17, 05/03/2020] Edmundo: o motivo é que o supervisord sobrescreve essa propriedade
> [13:17, 05/03/2020] Edmundo: e tem a própria configuração pra isso
> [13:18, 05/03/2020] Edmundo: Pra vc conferir o número de arquivos que podem ser abertos por um processo, bastas pegar o PID e dar um cat /proc/PID/limits
> [13:19, 05/03/2020] Edmundo: pra mudar esse número, tem que ir em supervisord.conf e botar minfds=65536 lá dentro
> [13:20, 05/03/2020] Edmundo: É isso hehehe. Não foi fácil descobrir, mas é fácil resolver.
> [13:21, 05/03/2020] Edmundo: Ah, tem outra dica de ouro
> [13:21, 05/03/2020] Edmundo: Colocar isso no teu javascript, pra desconectar do socket quando sair
> [13:21, 05/03/2020] Edmundo: window.onbeforeunload = function() {
>         if (socket) {
>             try {
>                 socket.close();
>             }
>             catch(err) {}
>         }
>     };
> [13:22, 05/03/2020] Edmundo: Não tem nos tutoriais do tornado tb
> [13:24, 05/03/2020] Tony Lâmpada: Meu Deus Ed... muito obrigado. Imagino o tamanho do rolê pra diagnosticar esses problemas todos. 
> Entendo demais o inquietação de "puta merda eu não posso levar esses segredos pro túmulo!" kkkk
> [13:25, 05/03/2020] Tony Lâmpada: Eu vou salvar essa conversa no meu http://github.com/tonylampada/randomstuff blz? Pq eu sei que tando lá, no dia que eu precisar eu encontro. 🙂
> [13:25, 05/03/2020] Edmundo: Hehehe, boa
> [13:25, 05/03/2020] Edmundo: estou colocando no stack overflow tb
> [13:25, 05/03/2020] Edmundo: ninguém deu a dica correta

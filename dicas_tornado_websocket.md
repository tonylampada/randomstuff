Hoje o Ed me deu umas dicas preciosíssimas sobre manter no ar um serviço de websocket com tornado.
Tô salvando aqui pq tem uma chance bem alta de isso ser útil no futuro (pra mim ou pra alguma outra pobre alma)

----------------------

> Edmundo: Tony, tudo blz? Vc está usando servidor de websockets? Acabei de corrigir um monte de problemas nele que não eram tão fáceis de descobrir, se quiser umas dicas.

> Tony Lâmpada: Ainda não, mas bom saber

> Edmundo: Cara, ninguém fala isso nos tutoriais do tornado

> Edmundo: Foi foda

> Tony Lâmpada: A hora que precisar eu já sei pra quem pedir rs

> Edmundo: Vou te passar a dica logo então

> Edmundo: Todo processo no ubuntu tem um limite de arquivos que podem ser abertos determinado pelo sistema operacional

> Tony Lâmpada: opa, mandae, agradeço de ❤ 🙂

> Edmundo: esse limite normalmente é 1024

> Edmundo: Quando o tornado cria uma conexão via websocket

> Edmundo: ele cria um arquivo sock

> Edmundo: então dá pra ver que ele pode precisar criar muitos arquivos

> Edmundo: aí, depois de fuçar os logs

> Edmundo: vc descobre isso e vai pesquisar como mudar esse limite

> Edmundo: só que mesmo assim não funciona

> Edmundo: o motivo é que o supervisord sobrescreve essa propriedade

> Edmundo: e tem a própria configuração pra isso

> Edmundo: Pra vc conferir o número de arquivos que podem ser abertos por um processo, bastas pegar o PID e dar um cat /proc/PID/limits

> Edmundo: pra mudar esse número, tem que ir em supervisord.conf e botar minfds=65536 lá dentro

> Edmundo: É isso hehehe. Não foi fácil descobrir, mas é fácil resolver.

> Edmundo: Ah, tem outra dica de ouro

> Edmundo: Colocar isso no teu javascript, pra desconectar do socket quando sair

```javascript
window.onbeforeunload = function() {
    if (socket) {
        try {
            socket.close();
        }
        catch(err) {}
    }
};
```

> Edmundo: Não tem nos tutoriais do tornado tb

> Tony Lâmpada: Meu Deus Ed... muito obrigado. Imagino o tamanho do rolê pra diagnosticar esses problemas todos. 

> Entendo demais o inquietação de "puta merda eu não posso levar esses segredos pro túmulo!" kkkk

> Tony Lâmpada: Eu vou salvar essa conversa no meu http://github.com/tonylampada/randomstuff blz? Pq eu sei que tando lá, no dia que eu precisar eu encontro. 🙂

> Edmundo: Hehehe, boa

> Edmundo: estou colocando no stack overflow tb

> Edmundo: ninguém deu a dica correta

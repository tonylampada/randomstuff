```html
<table id="SiteBuilder_TbConteudo" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <td align="left" valign="top">
            <div id="SiteBuilder_Conteudo">
                <div style="text-align: center;">
                    <img alt="" src="/SiteBuilder/UploadUsers/pudim.com.br/pudim.jpg" 
                    style="border-width: 0px; border-style: solid;" />
                </div>
            </div>
        </td>
    </tr>
</table>
<div id="SiteBuilder_Rodape">
    <div id="div_RodapeViewMode" class="div_RodapeViewMode">
        <a href="mailto:pudim@pudim.com.br">pudim@pudim.com.br</a>
    </div>
</div>
```

```css
body
{
	font-size: 11px;
	font-family: arial;
	font-weight: normal;
	color: #333333;
	text-decoration: none;
	margin: 0;
	padding: 0;	
	background-color:#D0D0D0;
}
html > body
{
	font-size: 11px;
	font-family: arial;
	font-weight: normal;
	color: #333333;
	text-decoration: none;
	margin: 0;
	padding: 0;
}
```

```javascript
function init(provider, ref, element){  
    if(element) m.element = element;

    if(provider == 'youtube')
        m.player = new YoutubePlayer(ref);
    else if(provider == 'vimeo')
        m.player = new VimeoPlayer(ref);
    else if(provider == 'sambatech')
        m.player = new SambatechPlayer(ref);
    m.player.load(m.element);
}
```

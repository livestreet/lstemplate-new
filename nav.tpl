
<div id="nav">
	<div id="nav-inner">
		{if $oUserCurrent}
			<a href="{router page='topic'}add/" class="button-publish js-write-window-show" id="modal_write_show"><span>{$aLang.topic_create}</span></a>
		{/if}

		{if $menu}
			{if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
        {elseif $sAction=='talk'}
            {include file="menu.talk.tpl"}
		{/if}

		<form action="{router page='search'}topics/" method="GET" class="search">
			<input class="text" type="text" onblur="if (!value) value=defaultValue" onclick="if (value==defaultValue) value=''" value="{$aLang.search}" name="q" />
			<input class="search-submit" type="submit" value="" title="{$aLang.search_submit}" />
		</form>
	</div>
</div>

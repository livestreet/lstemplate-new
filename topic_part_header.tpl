{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<div class="topic topic-type-{$oTopic->getType()} js-topic">
	<h1 class="title">
		{if $bTopicList}
			<a href="{$oTopic->getUrl()}" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
		{else}
			{$oTopic->getTitle()|escape:'html'}
		{/if}

    	{if $oTopic->getPublish() == 0}
    		<i class="icon-synio-topic-draft" title="{$aLang.topic_unpublish}"></i>
    	{/if}

    	{if $oTopic->getType() == 'link'}
    		<i class="icon-synio-topic-link" title="{$aLang.topic_link}"></i>
    	{/if}
	</h1>

	<div class="topic-info-favourite" onclick="return ls.favourite.toggle({$oTopic->getId()},$('#fav_topic_{$oTopic->getId()}'),'topic');">
		<i id="fav_topic_{$oTopic->getId()}" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></i>
	    <span class="favourite-count" id="fav_count_topic_{$oTopic->getId()}">{if $oTopic->getCountFavourite()}{$oTopic->getCountFavourite()}{/if}</span>
	</div>

	<div class="info-top">
		<a href="{$oBlog->getUrlFull()}" class="title-blog">{$oBlog->getTitle()|escape:'html'}</a>

        {if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
		<span class="actions">
			{if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
				<a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}" class="edit">{$aLang.topic_edit}</a>
			{/if}
			{if $oUserCurrent and ($oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
				<a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="delete">{$aLang.topic_delete}</a>
			{/if}
		</span>
        {/if}
	</div>
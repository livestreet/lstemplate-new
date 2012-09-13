{assign var="sidebarPosition" value='left'}
{include file='header.tpl'}      

{assign var="oUser" value=$oTalk->getUser()}


<article class="topic topic-type-talk">
	<h1 class="title word-wrap">
		{$oTalk->getTitle()|escape:'html'}
    </h1>

    <div class="topic-info-favourite"><a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},$('#fav_topic_{$oTalk->getId()}'),'talk');"><i id="fav_topic_{$oTalk->getId()}" class="favourite {if $oTalk->getIsFavourite()}active{/if}"></i></a></div>

	<div class="topic-content text">
		{$oTalk->getText()}
	</div>

	{include file='actions/ActionTalk/speakers.tpl'}

    <ul class="info">
    	<li class="date">
    		<time datetime="{date_format date=$oTalk->getDate() format='c'}" pubdate title="{date_format date=$oTalk->getDate() format='j F Y, H:i'}">
                    {date_format date=$oTalk->getDate() format="j F Y, H:i"}
    		</time>
    	</li>
    	<li class="username">
    		<a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
    	</li>

    	<li class="comments-link"><a href="{router page='talk'}delete/{$oTalk->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" onclick="return confirm('{$aLang.talk_inbox_delete_confirm}');" class="delete">{$aLang.delete}</a></li>
        {hook run='talk_read_info_item' talk=$oTalk}
    </ul>
</article>

{assign var="oTalkUser" value=$oTalk->getTalkUser()}

{if !$bNoComments}
{include
	file='comment_tree.tpl'
	iTargetId=$oTalk->getId()
	sTargetType='talk'
	iCountComment=$oTalk->getCountComment()
	sDateReadLast=$oTalkUser->getDateLast()
	sNoticeCommentAdd=$aLang.topic_comment_add
	bNoCommentFavourites=true}
{/if}
			
			
{include file='footer.tpl'}
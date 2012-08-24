<div class="comments comment-list">
	{foreach from=$aComments item=oComment}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}

        <div class="comment">
        <div class="path">
			<a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a> /
			<a href="{$oBlog->getUrlFull()}" class="blog-name">{$oBlog->getTitle()|escape:'html'}</a>
			<a href="{$oTopic->getUrl()}#comments" class="comments-total">{$oTopic->getCountComment()}</a>
		</div>

			<div id="vote_area_comment_{$oComment->getId()}" class="vote
																		{if $oComment->getRating() > 0}
																			vote-count-positive
																		{elseif $oComment->getRating() < 0}
																			vote-count-negative
																		{/if}">
				<span class="vote-count" id="vote_total_comment_{$oComment->getId()}">{if $oComment->getRating()>0}+{/if}{$oComment->getRating()}</span>
			</div>
            
		<div id="comment_content_id_{$oComment->getId()}" class="comment-content">

			<div class="text">
				{if $oComment->isBad()}
					<div style="color: #aaa;">{$oComment->getText()}</div>
				{else}
					{$oComment->getText()}
				{/if}
			</div>
		</div>

			<ul class="comment-info">
				<li class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" /></a></li>
				<li class="comment-author"><a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
				<li class="comment-date">
    				<time datetime="{date_format date=$oComment->getDate() format='c'}" title="{date_format date=$oComment->getDate() format="j F Y, H:i"}">
    					{date_format date=$oComment->getDate() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
    				</time>
                </li>
				<li><a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="comment-link"></a></li>
			</ul>
		</div>
	{/foreach}
</div>


{include file='paging.tpl' aPaging=$aPaging}
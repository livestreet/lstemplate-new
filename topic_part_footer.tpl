	{assign var="oBlog" value=$oTopic->getBlog()}
	{assign var="oUser" value=$oTopic->getUser()}
	{assign var="oVote" value=$oTopic->getVote()}
	{assign var="oFavourite" value=$oTopic->getFavourite()}

      	<ul class="tags js-favourite-insert-after-form js-favourite-tags-topic-{$oTopic->getId()}">
      		{strip}
        		{if $oTopic->getTagsArray()}
        			{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
        				<li>{if !$smarty.foreach.tags_list.first}, {/if}<a rel="tag" href="{router page='tag'}{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
        			{/foreach}
        		{else}
        			<li>{$aLang.topic_tags_empty}</li>
        		{/if}

        		{if $oUserCurrent}
        			{if $oFavourite}
        				{foreach from=$oFavourite->getTagsArray() item=sTag name=tags_list_user}
        					<li class="topic-tags-user js-favourite-tag-user">, <a rel="tag" href="{$oUserCurrent->getUserWebPath()}favourites/topics/tag/{$sTag|escape:'url'}/">{$sTag|escape:'html'}</a></li>
        				{/foreach}
        			{/if}

        			<li class="topic-tags-edit js-favourite-tag-edit" {if !$oFavourite}style="display:none;"{/if}>
        				&nbsp;&nbsp;<a href="#" onclick="return ls.favourite.showEditTags({$oTopic->getId()},'topic',this);" class="link-dotted">{$aLang.favourite_form_tags_button_show}</a>
        			</li>
        		{/if}
        	{/strip}
      	</ul>

		<div class="topic-share" id="topic_share_{$oTopic->getId()}">
			{hookb run="topic_share" topic=$oTopic bTopicList=$bTopicList}
				<div class="yashare-auto-init" data-yashareTitle="{$oTopic->getTitle()|escape:'html'}" data-yashareLink="{$oTopic->getUrl()}" data-yashareL10n="ru" data-yashareType="button" data-yashareQuickServices="yaru,vkontakte,facebook,twitter,odnoklassniki,moimir,lj,gplus"></div>
			{/hookb}
			<div class="arrow"></div>
		</div>

    	{if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
    		{assign var="bVoteInfoShow" value=true}
    	{/if}

		<ul class="info">
    		<li id="vote_area_topic_{$oTopic->getId()}" class="vote
																	{if $oVote || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId()) || strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}
																		{if $oTopic->getRating() > 0}
																			vote-count-positive
																		{elseif $oTopic->getRating() < 0}
																			vote-count-negative
																		{elseif $oTopic->getRating() == 0}
																			vote-count-zero
																		{/if}
																	{/if}

																	{if !$oUserCurrent or ($oUserCurrent && $oTopic->getUserId() != $oUserCurrent->getId())}
																		vote-not-self
																	{/if}

																	{if $oVote}
																		voted

																		{if $oVote->getDirection() > 0}
																			voted-up
																		{elseif $oVote->getDirection() < 0}
																			voted-down
																		{elseif $oVote->getDirection() == 0}
																			voted-zero
																		{/if}
																	{else}
																		not-voted
																	{/if}

																	{if (strtotime($oTopic->getDateAdd()) < $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time') && !$oVote) || ($oUserCurrent && $oTopic->getUserId() == $oUserCurrent->getId())}
																		vote-nobuttons
                                                                    {/if}

                                                                    {if strtotime($oTopic->getDateAdd()) > $smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}       
                                                                        vote-not-expired
                                                                    {/if}
                                                                    {if $bVoteInfoShow}js-infobox-vote-topic{/if}">

    			<a href="#" class="vote-up" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"></a>
    				<span class="vote-count" id="vote_total_topic_{$oTopic->getId()}">
							{if $bVoteInfoShow}
								{if $oTopic->getRating() > 0}+{/if}{$oTopic->getRating()}
							{else}
								<i onclick="return ls.vote.vote({$oTopic->getId()},this,0,'topic');">&mdash;</i>
							{/if}
						</span>
    			<a href="#" class="vote-down" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"></a>

                {if $bVoteInfoShow}
    				<div id="vote-info-topic-{$oTopic->getId()}" style="display: none;">
    					<ul class="vote-topic-info">
    						<li><i class="icon-synio-vote-info-up"></i> {$oTopic->getCountVoteUp()}</li>
    						<li><i class="icon-synio-vote-info-down"></i> {$oTopic->getCountVoteDown()}</li>
    						<li><i class="icon-synio-vote-info-zero"></i> {$oTopic->getCountVoteAbstain()}</li>
    						{hook run='topic_show_vote_stats' topic=$oTopic}
    					</ul>
    				</div>
    			{/if}
    		</li>

			<li class="date">
				<time datetime="{date_format date=$oTopic->getDateAdd() format='c'}" title="{date_format date=$oTopic->getDateAdd() format='j F Y, H:i'}">
					{date_format date=$oTopic->getDateAdd() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}
				</time>
			</li>
			<li class="username">
				<a rel="author" href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
			</li>
    		{if $bTopicList}
    			<li class="comments-link">
    				{if $oTopic->getCountComment()>0}
    					<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_read}">{$oTopic->getCountComment()} <span>{if $oTopic->getCountCommentNew()}+{$oTopic->getCountCommentNew()}{/if}</span></a>
    				{else}
    					<a href="{$oTopic->getUrl()}#comments" title="{$aLang.topic_comment_add}">{$aLang.topic_comment_add}</a>
    				{/if}
    			</li>
    		{/if}
			<li class="topic-info-share" data-topic-id="{$oTopic->getId()}" onclick="jQuery('#topic_share_{$oTopic->getId()}').slideToggle(); return false;"><i class="icon-synio-share-blue" title="{$aLang.topic_share}"></i></li>

			
			{hook run='topic_show_info' topic=$oTopic}
		</ul>

		
		{if !$bTopicList}
			{hook run='topic_show_end' topic=$oTopic}
		{/if}
	</footer>
</div>
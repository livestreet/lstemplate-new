<div id="header">
	{if $oUserCurrent}
		<div class="profile">
			<a href="{$oUserCurrent->getUserWebPath()}"><img src="{$oUserCurrent->getProfileAvatarPath(48)}" alt="{$oUserCurrent->getLogin()}" class="avatar" /></a>
			<ul>
				<li>
					<a href="{$oUserCurrent->getUserWebPath()}" class="username">{$oUserCurrent->getLogin()}</a>
					(<a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="logout">{$aLang.exit}</a>)
				</li>
				<li>
					{if $iUserCurrentCountTalkNew}
						<a href="{router page='talk'}" class="message new" id="new_messages" title="{$aLang.user_privat_messages_new}">{$iUserCurrentCountTalkNew}</a>
					{else}
						<a href="{router page='talk'}" id="new_messages" class="message"></a>
					{/if}
					{$aLang.user_settings} <a href="{router page='settings'}profile/" class="author">{$aLang.user_settings_profile}</a> |
					<a href="{router page='settings'}tuning/" class="author">{$aLang.user_settings_tuning}</a>
				</li>
				<li>
                    {$aLang.user_rating} <strong>{$oUserCurrent->getRating()}</strong>
				    {hook run='userbar_stat_item'}
                </li>
				{hook run='userbar_item_last'}

				{hook run='userbar_item'}
			</ul>
		    {hook run='userbar_nav'}
		</div>
	{else}
		<div class="auth">
			<a href="{router page='login'}"  class="js-login-form-show login-link">{$aLang.user_login_submit}</a> {$aLang.or}
			<a href="{router page='registration'}" class="js-registration-form-show">{$aLang.registration_submit}</a>
		</div>
	{/if}

	<a href="{cfg name='path.root.web'}" class="logo">{cfg name='view.name'}</a>         

	<ul class="pages">
		<li {if $sMenuHeadItemSelect=='blog'}class="active"{/if}><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
		<li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
		<li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}">{$aLang.people}</a></li>
		<li {if $sMenuItemSelect=='stream'}class="active"{/if}><a href="{router page='stream'}">{$aLang.stream_menu}</a></li>

		{hook run='main_menu_item'}
	</ul>

    {hook run='main_menu'}
</div>
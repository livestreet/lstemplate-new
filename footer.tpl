			{hook run='content_end'}
			</div><!-- /content-inner -->
		</div><!-- /content -->

		{if !$noSidebar}
			{include file='sidebar.tpl'}
		{/if}
	</div><!-- /wrapper -->

	<div id="footer">
		<div id="footer-inner">
			<div class="right">{hook run='copyright'}</div>
			Design by — <a href="http://www.xeoart.com">Студия XeoArt</a>
			<img border="0" src="{cfg name='path.static.skin'}/images/xeoart.gif">
			{if $oUserCurrent and $oUserCurrent->isAdministrator()}| <a href="{cfg name='path.root.web'}/admin">{$aLang.admin_title}</a>{/if}
			{hook run='footer_end'}
		</div>
	</div>    
</div> <!-- /container -->

{include file='toolbar.tpl'}

{hook run='body_end'}

</body>
</html>
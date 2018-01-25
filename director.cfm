<!---Get page content for fld_pageID = 1--->
<cfset pageService = createObject("component",'cfTraining.components.pageService' ) />
<cfset rsPage = pageService.getPageByID(1)>
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - Director">
  <div id="pageBody">
  	<cfoutput>
  		<h1>#rsPage.FLD_PAGETITLE#</h1>
  		#rsPage.FLD_PAGECONTENT#
  	</cfoutput>
  </div>
</cfmodule>
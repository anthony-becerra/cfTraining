<!---Get page content for fld_pageID = 2--->
<cfset pageService = createObject("component",'cfTraining.components.pageService' ) />
<cfset rsPage = pageService.getPageByID(2)>
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - History">
  <div id="pageBody">
  <!---Insert database content from here--->
  <cfoutput>
  	<h1>#rsPage.FLD_PAGETITLE#</h1>
  	#rsPage.FLD_PAGECONTENT#
  </cfoutput>
  <!---To here--->
</div>
</cfmodule>
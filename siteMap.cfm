<!---Get page content for fld_pageID = 5--->
<cfset pageService = createObject("component",'cfTraining.components.pageService' ) />
<cfset rsPage = pageService.getPageByID(5)>
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - Site Map">
  <div id="pageBody">
  <!---Insert database content from here--->
  <cfoutput>
  	<h1>#rsPage.FLD_PAGETITLE#</h1>
  	#rsPage.FLD_PAGECONTENT#
  </cfoutput>
  <!---To here--->
</div>
</cfmodule>
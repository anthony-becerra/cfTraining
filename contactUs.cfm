<!---Get page content for fld_pageID = 6--->
<cfset pageService = createObject("component",'cfTraining.components.pageService' ) />
<cfset rsPage = pageService.getPageByID(6)>
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - Contact Us">
  <div id="pageBody">
  <!---Insert database content from here--->
  <cfoutput>
  	<h1>#rsPage.FLD_PAGETITLE#</h1>
  	#rsPage.FLD_PAGECONTENT#
  </cfoutput>
  <!---To here--->
</div>
</cfmodule>
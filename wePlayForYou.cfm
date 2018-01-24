<!---Get page content for fld_pageID = 3--->
<cfquery datasource="hdStreet" name="rsPage">
	SELECT FLD_PAGETITLE, FLD_PAGECONTENT
	FROM TBL_PAGES
	WHERE FLD_PAGEID = 3 AND FLD_PAGEISACTIVE = 1
</cfquery>

<!---Include header --->
<cfinclude template="includes/header.cfm" >
  <div id="pageBody">
  <!---Insert database content from here--->
  	<cfoutput>
  		<h1>#rsPage.FLD_PAGETITLE#</h1>
  		#rsPage.FLD_PAGECONTENT#
  	</cfoutput>
  <!---To here--->
</div>
<cfinclude template="includes/footer.cfm" >
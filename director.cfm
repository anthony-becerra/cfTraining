<!---
Get page content
cfquery requires datasource(name of database) and name (local variable that will contain data retrieved from DB)
rsPage > 'rs' stands for 'record set'
--->
<cfquery datasource="hdStreet" name="rsPage">
	SELECT FLD_PAGETITLE, FLD_PAGECONTENT
	FROM TBL_PAGES
	WHERE FLD_PAGEID = 1 AND FLD_PAGEISACTIVE = 1
</cfquery>

<!---Include header --->
<cfinclude template="includes/header.cfm" >
  <div id="pageBody">
  	<cfoutput>
  		<h1>#rsPage.FLD_PAGETITLE#</h1>
  		#rsPage.FLD_PAGECONTENT#
  	</cfoutput>
  </div>
<cfinclude template="includes/footer.cfm" >
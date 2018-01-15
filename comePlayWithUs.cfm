<!---Form processing script starts here--->
<cfif structKeyExists(form,'fld_newUserSubmit')>
	<!---Server side data validation --->
	<cfset aErrorMessages = Arraynew(1)>
	<!---Validate first name --->
	<cfif fld_userFirstName EQ ''>
		<cfset arrayAppend(aErrorMessages,'Please provide a valid first name')>
	</cfif>
	<!---Validate last name --->
	<cfif fld_userLastName EQ ''>
		<cfset arrayAppend(aErrorMessages,'Please provide a valid last name')>
	</cfif>
	<!---Validate eMail address --->
	<cfif fld_userEmail EQ '' OR NOT isvalid("eMail",form.fld_userEmail)>
		<cfset arrayAppend(aErrorMessages,'Please provide a valid email address')>
	</cfif>
	<!---Check if aErrorMessage array is empty --->
	<cfif arrayIsEmpty(aErrorMessages)>
		<!---Generate the missing data for a new user --->
		<cfset form.fld_userPassword = generateSecretKey("AES")>
		<cfset form.fld_userRole = 1 >
		<cfset form.fld_userApproved = 0>
		<cfset form.fld_userIsActive = 0>
		<!---Insert data in database if no error detected --->
		<cfquery datasource="hdStreet" >
			INSERT INTO TBL_USERS
			(FLD_USERFIRSTNAME,FLD_USERLASTNAME,FLD_USEREMAIL,FLD_USERPASSWORD,FLD_USERCOMMENT,FLD_USERAPPROVED,FLD_USERISACTIVE,FLD_USERROLE,FLD_USERINSTRUMENT)
			VALUES
			('#form.fld_userFirstName#', '#form.fld_userLastName#', '#form.fld_userEmail#', '#form.fld_userPassword#', '#form.fld_userComment#', #form.fld_userApproved#, #form.fld_userIsActive#, #form.fld_userRole#, #form.fld_userInstrument#)
		</cfquery>
		<cfset userIsInserted=true>
	</cfif>
</cfif>
<!---Get page content for fld_pageID = 4--->
<cfquery datasource="hdStreet" name="rsPage">
	SELECT FLD_PAGETITLE, FLD_PAGECONTENT
	FROM TBL_PAGES
	WHERE FLD_PAGEID = 4 AND FLD_PAGEISACTIVE = 1
</cfquery>
<!---Get instruments list in alpha order to fill drop down menu of the form --->
<cfquery datasource="hdStreet" name="rsInstrumentsList">
	SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
	FROM TBL_INSTRUMENTS
	ORDER BY FLD_INSTRUMENTNAME ASC 
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Come play with us</title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.html">Site Map</a></li>
        <li><a href="contactUs.html">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.html">Agenda</a></li>
      <li><a href="#">The Band</a>
        <ul>
          <li><a href="director.html">The director</a></li>
          <li><a href="history.html">The band History</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.html">We play for You</a></li>
      <li><a href="comePlayWithUs.html">Come play with us</a></li>
      <li><a href="news.html">News</a></li>
    </ul>
  </div>
  <div id="pageBody">
  	<div id="calendarContent">
    <!---Insert database content from here--->
	<cfoutput>
		<h1>#rsPage.FLD_PAGETITLE#</h1>
		#rsPage.FLD_PAGECONTENT#
	</cfoutput>
    <!---To here--->
	</div>
	<div id="calendarSideBar">
		<!---If userIsInserted exists --->
		<cfif isdefined('userIsInserted')>
			<h2>Thank you!</h2>
			<p>Your demand has been successfully submitted. You should hear from us very soon!</p>
			<p>Enjoy the music!</p>
			<i>The HD Street Band Staff</i>
		<!---Else --->
		<cfelse>
			<h2>Complete the form below to join our band</h2>
			<!---If aErrorMessages exists and not empty, display error message --->
			<cfif isDefined("aErrorMessages") AND NOT arrayIsEmpty(aErrorMessages)>
				<cfoutput >
					<cfloop array="aErrorMessages" index="message">
						<p class="errorMessage">#message#</p>
					</cfloop>
				</cfoutput>
			</cfif>
			<!---CF Form on sidebar right--->
			<cfform id="frm_newUser">
				<fieldset>
					<legend>Join our band</legend>
					<dl>
						<dt><label>First Name</label></dt>
						<dd><cfinput type="text" name="fld_userFirstName" id="fld_userFirstName" required="true" message="Please enter a first name"/></dd>
						<dt><label>Last Name</label></dt>
						<dd><cfinput type="text" name="fld_userLastName" id="fld_userLastName" required="true" message="Please enter a last name"/></dd>
						<dt><label>E-mail Address</label></dt>
						<dd><cfinput type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="eMail" message="Please enter a valid email address"/></dd>
						<dt><label>Instrument</label></dt>
						<dd>
							<cfselect name="fld_userInstrument" id="fld_userInstrument" query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME" queryposition="below">
								<option value="0">Please choose your instrument</option>
							</cfselect>
						</dd>
						<dt><label>Comment</label></dt>
						<dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
					</dl>
					<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band" />
				</fieldset>
			</cfform>
		</cfif>
	</div>
	</div>
 </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>

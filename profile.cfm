<!---Create an instance of the userService component --->
<cfset userService = createobject("component",'cftraining.components.userService' ) />
<!---Form processing begins here--->
<cfif structKeyExists(form, 'fld_editUserSubmit')>
	<!---Server side form validation --->
	<cfset aErrorMessages = userService.validateUser(form.fld_userFirstName,form.fld_userLastName,form.fld_userEmail,form.fld_userPassword,form.fld_userPasswordConfirm) />
	<!---Continue if the aErrorMessages array is empty --->
	<cfif arrayIsEmpty(aErrorMessages)>	
		<cfset userService.updateUser(form.fld_userFirstName,form.fld_userLastName,form.fld_userEmail,form.fld_userPassword,form.fld_userRole,form.fld_userInstrument,form.fld_userComment,form.fld_userApproved,form.fld_userIsActive,form.fld_userID) />
		<cfset variables.formSubmitComplete = true />
	</cfif>
</cfif>
<!---Form processing ends here--->

<!---Get user to update--->
<cfset rsSingleUser = userService.getUserByID(2) />
<!---Get instruments to feed the form's Drop-Down list--->
<cfset rsInstrumentsList = userService.getInstruments() />
<!---Include header --->
<cfmodule template="customTags/front.cfm" title="HD Street Band - Profile">
	<div id="pageBody">
		<h1>Update your profile</h1>
		<cfform id="frm_editUser">
			<fieldset>
				<legend>Your profile</legend>
				<!---Output error messages if any--->
				<cfif isDefined('aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
					<cfoutput>
						<cfloop array="#aErrorMessages#" index="message">
							<p class="errorMessage">#message#</p>
						</cfloop>
					</cfoutput>
				</cfif>
				<!---Output feedback message if form has been successfully submitted--->
				<cfif structKeyExists(variables,'formSubmitComplete') AND variables.formSubmitComplete>
					<p class="feedback">Your profile has been updated!</p>
				</cfif>
				<dl>
					<!---First name text field--->
					<dt><label for="fld_userFirstName">First Name</label></dt>
					<dd><cfinput name="fld_userFirstName" id="fld_userFirstName" value="#rsSingleUser.FLD_USERFIRSTNAME#" required="true" message="Please provide a valid first name" validateAt="onSubmit" /></dd>
					<!---Last name text field--->
					<dt><label for="fld_userLastName">Last Name</label></dt>
					<dd><cfinput name="fld_userLastName" id="fld_userLastName" value="#rsSingleUser.FLD_USERLASTNAME#" required="true" message="Please, provide a valid last name" validateAt="onSubmit" /></dd>
					<!---E-Mail Address text field--->
					<dt><label for="fld_userEmail">E-mail Address</label></dt>
					<dd><cfinput name="fld_userEmail" id="fld_userEmail" value="#rsSingleUser.FLD_USEREMAIL#" required="true" validate="email" message="Please, provide a valid e-mail Address" validateAt="onSubmit" /></dd>
					<!---Password text field--->
					<dt><label for="fld_userPassword">Password</label></dt>
					<dd><cfinput type="password" name="fld_userPassword" value="#rsSingleUser.FLD_USERPASSWORD#" id="fld_userPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
					<dt><label for="fld_userPasswordConfirm">Confirm password</label></dt>
					<dd><cfinput type="password" name="fld_userPasswordConfirm" value="#rsSingleUser.FLD_USERPASSWORD#" id="fld_userPasswordConfirm" required="true" message="Please, confirm your password" validateAt="onSubmit" /></dd>
					<!---Instruments drop-down list--->
					<dt><label for="fld_userInstrument">Instrument</label></dt>
					<dd>
						<cfselect name="fld_userInstrument" id="fld_userInstrument" query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME" queryposition="below" selected="#rsSingleUser.FLD_USERINSTRUMENT#">
							<option value="0">Please choose your instrument</option>
						</cfselect>
					</dd>
					<!---Comment Textarea--->
					<dt><label for="fld_userComment">Comment</label></dt>
					<dd><cftextarea name="fld_userComment" id="fld_userComment" richtext="true" toolbar="Basic">
							<cfoutput>
								#rsSingleUser.FLD_USERCOMMENT#
							</cfoutput>
						</cftextarea></dd>
				</dl>
				<!---Add userID, userRole, userIsActive, userApproved to form --->
				<cfinput name="fld_userID" value="#rsSingleUser.FLD_USERID#" type="hidden" />
				<cfinput name="fld_userRole" value="1" type="hidden" />
				<cfinput name="fld_userIsActive" value="1" type="hidden" />
				<cfinput name="fld_userApproved" value="1" type="hidden" />
				<!---Submit button--->
				<input type="submit" name="fld_editUserSubmit" id="fld_editUserSubmit" value="Update my profile" />
			</fieldset>
		</cfform>
	</div>
</cfmodule>
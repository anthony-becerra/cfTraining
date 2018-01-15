<!---If data not passed in checkboxes, sets value as "NO"--->
<cfparam name="form.fld_conditions" default="NO">
<cfparam name="form.fld_interests" default="none" >
<!---Using form scope with post method--->
<cfdump var="#form#" >
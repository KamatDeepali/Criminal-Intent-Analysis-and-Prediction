
/*
 *  validation.js
 *
 * Project:Crime Prediction
 * 
 *
 * @version   :validation.js,v 1.1 2015/10/03 23:31:20
 *
 * @author    : Apurwa Dandekar  Id$ ard5145
 *              Deepali Kamat Id$ ddk9074  
				Eric Fortunato Id$ eef2302
 *
 */


function validate()
{
 var location= document.myForm.location.value;
 var month=document.myForm.month.value;
 //if location is empty
   if( location == "" )
   {
     alert( "Please provide the location" );
     document.myForm.location.focus;
     return false;
   }
   
   //if month is empty
   if(month == "NULL" )
   {
     alert( "Please provide the month" );
	 document.myForm.month.focus;
     return false;
   }
   //if year is empty
  
}
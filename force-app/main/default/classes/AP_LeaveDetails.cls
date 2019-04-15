public class AP_LeaveDetails {

/*
* author : Hashim Alleemudder - alleemudder.hashim@accenture.com
* description : Method to get the list of Leave details for a particular Contact Owner.
* date : 26/03/2019
* params : Contact Owner Name - The Name of the Contact Owner.
*/ 
    /*@AuraEnabled
    public static List<Leave__c> getLeaveDetails(String ctName){
        //Initialising list to contain leave details of contact.
        List<Leave__c> leaveDetailsList = new List<Leave__c>();
        //Query Leave Details
        leaveDetailsList = [SELECT ID, ofHours__c, Date_From__c, Date_To__c, Approval_Status__c, Leave_For__c
                            FROM Leave__c
                            WHERE Leave_For__r.Name =: ctName
                            LIMIT 10];
        return leaveDetailsList;
    }*/
    
    @AuraEnabled
    public static String getLeaveDetails(){
        //Initialising list to contain leave details of contact.
        List<Leave__c> leaveDetailsList = new List<Leave__c>();
        //Query Leave Details
        leaveDetailsList = [SELECT ID, Name, Type_of_Leave__c, ofHours__c, Date_From__c, Date_To__c, Approval_Status__c, Leave_For__r.Name
                            FROM Leave__c
                            LIMIT 50];
        String leaveListSerialize = JSON.serialize(leaveDetailsList);
        return leaveListSerialize;
    }
    
}
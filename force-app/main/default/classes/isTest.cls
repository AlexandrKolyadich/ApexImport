@isTest
public class testLogic {
    @isTest static void testFirst(){
        Base_Station__c station = new Base_Station__c(Name = 'IsTest');
        insert station;
    String testj = csvImportExport.insertData('[{"Name":"hello","Sensor_Id__c":"1","Sensor_model__c":"CD451796","Status__c":"true"},{"Name":"adsda","Sensor_Id__c":"2","Sensor_model__c":"CD451796","Status__c":"true"}]');
    String test2 = csvImportExport.insertData('[{"Name":"IsTest","Sensor_Id__c":"5","Sensor_model__c":"CD451796","Status__c":"true"},{"Name":"IsTest","Sensor_Id__c":"7","Sensor_model__c":"CD451796","Status__c":"true"}]');
    System.assertEquals('',testj);
    System.assertEquals('SUCCESS',test2);
    }
}
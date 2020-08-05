public class csvImportExport {
   /* for import data into sobject and insert data from csv file  */ 
    @AuraEnabled
    public static string insertData(String strfromle){
        String returnresponse ='';
        List<Sensor__c> SensorListtoInsert = new List<Sensor__c>();
        //system.debug('strfromle = ' + strfromle);
        List<fieldWrapper> datalist = (List<fieldWrapper>)JSON.deserialize(strfromle, List<fieldWrapper>.class);
        /*
            * List<Sensor__c> sensors = new List<Sensor__c>();
            List<Base_Station__c> stations = [select Id from Base_Station__c ];
            
            Sensor__c sensor = new Sensor__c();
            sensor.Name = 'test';
            sensor.Base_Station__c = stations.get(0).Id;
            insert sensor;


 		public String Name;        
        public String Sensor_Id__c;        
        public String Sensor_model__c;
        public String Status__c;

*/
        List<Base_Station__c> stations = [select Id, Name from Base_Station__c ];
        for(Base_Station__c station:stations){
            Integer i;
            for( i = 0; i < datalist.size(); i++)
            {
                if(station.Name == datalist.get(i).Name ){
                    Sensor__c sensor = new  Sensor__c();
                    sensor.Name = datalist.get(i).Name;
                    sensor.Sensor_Id__c = datalist.get(i).SensorId;
                    sensor.Sensor_model__c = datalist.get(i).SensorModel;
                    sensor.Status__c = datalist.get(i).Status;
                    
                    sensor.Base_Station__c = station.Id;
                    
                    
                    SensorListtoInsert.add(sensor);
                }
                
               
            }
        }
        
                   
           
            
        
        if(SensorListtoInsert.size() > 0){
            try {
                insert SensorListtoInsert;
                returnresponse = 'SUCCESS';
            }
            catch(Exception ex){
                returnresponse = 'ERROR';
            }
        }
        return returnresponse;
    }
    
    public class fieldWrapper{        
        public String Name;        
        public String SensorId;        
        public String SensorModel;
        public String Status;
        
    } 
    
    
    
}
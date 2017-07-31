public class CostRedirectController {
public String CostRTId;
public String PCRStatus;
//public Impact__c ImpRecord;
//public string temp;

public CostRedirectController(ApexPages.StandardController stdController){

/*ImpRecord = (Impact__c)stdController.getRecord();
temp = ImpRecord.id;
ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'ImpId = ' + temp));*/

}
public PageReference NNIKUMTEST(){

                //testing 01
                string TCRId=ApexPages.currentPage().getParameters().get('PCRId');
                string ImpId=ApexPages.currentPage().getParameters().get('id');
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'TCRId = ' + TCRId));
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'ImpId = ' + ImpId));
                String returl=ApexPages.currentPage().getParameters().get('retURL');
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'returl= ' + returl));


        //System.debug('TCRId = ' + TCRId);
        List<Trend_Change__c>PCRList = [SELECT  TR_CR_Status__c from Trend_Change__c where id=:TCRId];
            for(Trend_Change__c PCR: PCRList)
            {
                //System.debug('status = ' + PCR.TR_CR_Status__c);
                ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Status = '+ PCR.TR_CR_Status__c ));
                PCRStatus=PCR.TR_CR_Status__c;
            }
                    List<RecordType> RTList = [select id from RecordType where DeveloperName = 'Copy_Impact_RT'];
         for(RecordType RT: RTList)
         {
             ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'RTID = '+ RT.id ));
             CostRTId=RT.id;
         }
         if(PCRStatus == 'New' && CostRTId != null)
         {
             //ImpRecrod.RecordTypeId = CostRTId ;   
             /*PageReference pg=new PageReference('/apex/PCRNewVFPage');
            pg.setredirect(true);
            return pg;    */     
            return NULL;
         }
    else
        return NULL;   
         

 }        
}
global class clsCarServices implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {        

    return Database.getQueryLocator('select Account__c, Contact__c, id from Car_Sales__c where Days__c = 83 or Days__c = 143 or Days__c = 173');
    }

    global void execute(Database.BatchableContext bc, List<Car_Sales__c> lstCarSales){
    
    List<String> exception_List;
    list<Case> lstCase = new list<Case>();
    system.debug('hellloooo');
    for(Car_Sales__c cs : lstCarSales){
    
        Case c = new Case();
        c.AccountId = cs.Account__c;
        c.ContactId = cs.Contact__c;
        c.Status = 'Scheduled';
        c.Priority = 'Low';
        c.Origin = 'Car Service';
        c.Reason = 'Car Service';
        c.Type = 'Car Service';
        c.Car_Sales__c = cs.id;
        c.Subject = 'Car Service Due in next 7 days';
        lstCase.add(c);    
    }
    
    
    database.saveresult[] SaveResultList= database.insert(lstCase, false);  
    system.debug('out1');
    for(integer i =0; i<lstCase.size();i++){
        String msg='';
        If(!SaveResultList[i].isSuccess()){
                msg +=  '\n'+'Error: "';        
                for(Database.Error err: SaveResultList[i].getErrors()){  
                     msg += err.getmessage()+'"\n\n';
                } 
        }
        system.debug('msg = '+msg);
        if(msg!='')
            exception_List.add(msg);
     }  

    }   

    global void finish(Database.BatchableContext bc){
    
    AsyncApexJob a = [Select Id, Status,ExtendedStatus,NumberOfErrors,     JobItemsProcessed,

        TotalJobItems, CreatedBy.Email

        from AsyncApexJob where Id =:BC.getJobId()];

  
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

            String[] toAddresses = new String[] {a.CreatedBy.Email};

            mail.setToAddresses(toAddresses);

            mail.setSubject('Match Merge Batch ' + a.Status);

            mail.setPlainTextBody('records processed ' + a.TotalJobItems +

           'with '+ a.NumberOfErrors + ' failures.');

            Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        
    }   
}
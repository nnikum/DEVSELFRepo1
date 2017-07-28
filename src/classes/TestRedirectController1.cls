public class TestRedirectController1{

public TestRedirectController1(ApexPages.StandardController stdController){}

public string PCRId,Newtest,tempid;
public string temp='Yes';
public PageReference MyTest1(){

tempid = ApexPages.currentPage().getParameters().get('id');
Newtest=ApexPages.currentPage().getParameters().get('New');
PCRId=ApexPages.currentPage().getParameters().get('PCRId');

ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'PCRId = ' + PCRId+', Newtest= ' + Newtest));

string retUrl='%2F'+PCRId;

//if(Newtest == 'Yes')
//if(Newtest.equals('Yes'))
//if(Newtest.equals(temp))
if(tempid==null)
{
    string test = Schema.getGlobalDescribe().get('Impact__c').getDescribe().getKeyPrefix();

    ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'I AM IN IF : 3  = ' + test));
    /*PageReference pg1 = new PageReference('/a01/e?retURL='+retUrl);
    pg1.setRedirect(true);
    return pg1; */  
    
}
else
ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'I AM IN ELSE : PCRId =  '+ PCRId+', Newtest= ' + Newtest));
return null;
}

}
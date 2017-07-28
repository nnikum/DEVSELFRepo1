global class clsCarSrviceSchdl implements Schedulable {

   global void execute(SchedulableContext sc) {

      clsCarServices cs = new clsCarServices();

      database.executebatch(cs);

   }

}
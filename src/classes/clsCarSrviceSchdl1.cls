global class clsCarSrviceSchdl1 implements Schedulable {

   global void execute(SchedulableContext sc) {

      clsCarSrviceSchdl cs = new clsCarSrviceSchdl();

      //database.executebatch(cs);
      
      //String sch = '0 2 * * * ? *';
      
      String day = string.valueOf(system.now().day());

        String month = string.valueOf(system.now().month());

        String hour = string.valueOf(system.now().hour());

        String minute = string.valueOf(system.now().minute() + 2);

        String second = string.valueOf(system.now().second());

        String year = string.valueOf(system.now().year());
        
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        
      system.schedule('SMAX Test ScheduleJob1', strSchedule , cs);

   }

}
public class HotelManagement {
 String hotelName;
     HotelRoom currHotelRoom = new HotelRoom();
    public static List<HotelRoom> htRooms= new List<HotelRoom>();
    public static List<HotelRoom> populateHotelRoom(integer noOfRooms){
        for(integer i=0;i<noOfRooms;i++){
            HotelRoom temp= new HotelRoom();
            temp.roomNo=i;
            temp.isEmpty=true;
            htRooms.add(temp);
        }
        return htRooms;
    }
    
    public static HotelRoom isRoomAvailable(){
        HotelRoom result;
        for(hotelroom htR:htRooms){
            if(htR.isEmpty){
                result=htr;
                break;
            }
        }
        return result;
    }
    
    public static HotelRoom registerCustomer(HotelRoom htRooom,Customer cst,HotelStaff stf){
        htRooom.currcustomer=cst;
        htRooom.staff=stf;
        return htRooom;
    }
    public static HotelManagement generateBill(HotelRoom htr){
        HotelManagement ht= new HotelManagement();
        ht.hotelName='Blue Moon';
        ht.currHotelRoom=htr;
      
        return ht;
    }/*HotelManagement.populateHotelRoom(5);
HotelRoom ht=HotelManagement.isRoomAvailable();
Customer cst= new Customer();
cst.name='Rahul';
cst.phone='34343';
cst.email='a@gmail';
HotelStaff htStf= new HotelStaff();
htStf.name='Rakehs';
htstf.empId='20';
ht=HotelManagement.registerCustomer(ht,cst,htStf);
system.debug(ht);*/
}
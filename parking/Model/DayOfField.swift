import Foundation

class DayOfField{
    var mAllParkFields:[ParkField];
    var mDate:Date;
    //var dateFormatter:DateFormatter = "YYMMDD";
    
    init(date:Date) {
        self.mDate = date;
        self.mAllParkFields = [ParkField(name: "Parking Place A",
                                         address: "1 Ultimo 2000 Sydney NSW",
                                         status: true,
                                         totalSlot: 10),
                               ParkField(name: "Parking Place B",
                                         address: "2 Ultimo 2000 Sydney NSW",
                                         status: true,
                                         totalSlot: 10),
                               ParkField(name: "Parking Place C",
                                         address: "3 Ultimo 2000 Sydney NSW",
                                         status: true,
                                         totalSlot: 10),
                               ParkField(name: "Parking Place D",
                                         address: "4 Ultimo 2000 Sydney NSW",
                                         status: true,
                                         totalSlot: 10),
                               ParkField(name: "Parking Place E",
                                         address: "5 Ultimo 2000 Sydney NSW",
                                         status: true,
                                         totalSlot: 10)
                               ]
    }
    
    func toJson() {
        
    }
    
    func toObj() {
        
    }
    
}

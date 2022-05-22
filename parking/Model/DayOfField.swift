import Foundation

protocol Codable {
    func toJson<Object>()throws where Object: Encodable;
    func toObj<Object>()throws where Object: Decodable;
}

class DayOfField: Codable{
    var mAllParkFields:[ParkField];
    var mDate:String;
    //var dateFormatter:DateFormatter = "YYMMDD";

    init() {
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
    
    func toJson<Object>() -> throw {
        let encoder = JSONEncoder();
        let data = try! encoder.encode(self);
        
        
    }
    
    func toObj<Object>() -> throw{

    }
    
}

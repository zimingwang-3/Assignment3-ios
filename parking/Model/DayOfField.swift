import Foundation

class DayOfField: Codable{
    var mAllParkFields:[ParkField];
    var mDate:String;
    //var dateFormatter:DateFormatter = "YYMMDD";
    
    init() {
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
    
    func toJson(date:String) {
        let url = Bundle.main.url(forResource: date, withExtension: "json");
        if let encodedData = try? JSONEncoder().encode(self) {

        }
        
    }
    
    func toObj(date:String) {
        let url = Bundle.main.url(forResource: "Data", withExtension: "json");
//        let fileManager = FileManager.default;
//        if fileManager.fileExists(atPath: date+".json") {
//
//        } else {
//            fileManager.createFile(atPath: date+".json", contents: nil, attributes: nil);
//            if let encodedData = try? JSONEncoder().encode(self) {
//                try? encodedData.write(to: url!, options: .noFileProtection)
//            }
//        }
        let encodedData = try? Data(contentsOf: url!)
        
        guard try? JSONDecoder().decode([DayOfField].self, from: encodedData) else {}
        
        
        
    }
    
}

import Foundation

class ParkField {
    let mName:String;
    let mAddress:String;
    var mStatus:Bool = true;
    var mTotalSlot:Int = 0;
    var mParkSlots:[ParkSlot] = [];
    
    init (name:String, address:String, status:Bool, totalSlot:Int) {
        self.mName = name;
        self.mAddress = address;
        self.mStatus = status;
        self.mTotalSlot = totalSlot;
        self.mParkSlots = [ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0),
                           ParkSlot(timeInterval: 0)];
    }
    
    //return the number of empty slots that after users select time
    func remainCount(date:Date, intervals:[Int]) -> Int {
        var result:Int = 0;
        for slot in mParkSlots {
            if (!slot.isUsed(times: intervals)) {
                result += 1;
            }
        }
        return result;
    }
    
    //set slots value after users confirm
    func bookSlot(date:Date, intervals:[Int]) {
        for slot in mParkSlots {
            if (!slot.isUsed(times: intervals)) {
                slot.setUsed(times: intervals);
            }
        }
    }
    
    func toJson() {
        let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        let strJson = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
    }
    
    func toObj() {
        
    }
}

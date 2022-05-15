import Foundation

class ParkField {
    let mTotalSlot:Int = 0;
    var mParkSlots:[ParkSlot] = [];
    
    init () {
        
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
}

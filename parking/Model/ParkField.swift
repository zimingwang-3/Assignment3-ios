import Foundation
import UIKit

class ParkField {
    let mName:String;
    let mAddress:String;
    var mStatus:Bool = true;
    var mTotalSlot:Int = 0;
    var mParkSlots:[Int] = [];
    
    init (name:String, address:String, status:Bool, totalSlot:Int) {
        self.mName = name;
        self.mAddress = address;
        self.mStatus = status;
        self.mTotalSlot = totalSlot;
        self.mParkSlots = [0b0,0b0,0b0,0b0,0b0,
                           0b0,0b0,0b0,0b0,0b0];
    }
    
    //return the number of empty slots that after users select time
    func remainCount(intervals:[Int]) -> Int {
        var result:Int = 0;
        for slot in mParkSlots {
            for i in intervals {
                if ((slot & 1 << i) != slot) {
                    result += 1;
                }
            }
        }
        return result;
    }
    //set slots value after users confirm
    func bookSlot(intervals:[Int]) {
        for i:Int in 0...mParkSlots.count-1 {
            for j in intervals {
                mParkSlots[i] |= (1 << j);
            }
        }
    }
    
    func cancelSlot(intervals:[Int]) {
        for i:Int in 0...mParkSlots.count-1 {
            for j in intervals {
                mParkSlots[i] ^= (1 << j);
            }
        }
    }
    
    func toJson(date:String) {
        let url = Bundle.main.url(forResource: date, withExtension: "json");
        let data = NSData(contentsOf: url!);
    }
    
    func toObj(date:String) {

        
    }
    

}

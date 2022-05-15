import Foundation

class ParkSlot {
    let id = UUID().uuidString;
    var mTimeInterval:Int = 0b0;
    var date:Date = Date.init();
    
    
    init () {
        
    }
    
    func setUsed(times:[Int]) {
        for i in times {
            self.mTimeInterval |= 1 << i;
        }
    }
    
    func isUsed(times:[Int]) -> Bool{
        for i in times {
            if ((self.mTimeInterval & 1 << i) == self.mTimeInterval) {
                return true;
            }
        }
        return false;
    }
}

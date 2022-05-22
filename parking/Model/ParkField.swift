import Foundation
import UIKit


enum Status:Int,HandyJSONEnum {
    case Idle = 0
    case Reserve = 1
}
class ParkField :HandyJSON{
    var mName: String!
    var mAddress: String!
    var mStatus: String!
    var mTotal: String!
    var mParkslots: [Status]!
    var mId:Int!
    var user:User?
    required init() {
        
    }
    
    func remainCount() -> Int {
       return mParkslots.filter { status in
            return status == .Idle
        }.count
    }
    //set slots value after users confirm
    func bookSlot(intervals:Int = -1) {
        if intervals == -1 {
            for index in 0..<mParkslots.count{
                if mParkslots[index] == .Idle{
                    mParkslots[index] = .Reserve
                    return
                }
            }
        }else{
            mParkslots[intervals] = .Reserve
        }
         
    }
    
    func cancelSlot(intervals:Int = -1) {
        if intervals == -1 {
            for index in 0..<mParkslots.count{
                if mParkslots[index] == .Reserve{
                    mParkslots[index] = .Idle
                    return
                }
            }
        }else{
            mParkslots[intervals] = .Idle
        }
        
    }
}

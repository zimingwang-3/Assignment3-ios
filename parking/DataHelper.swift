//
//  DataHelper.swift
//  parking
//
//  Created by hxq on 2022/5/22.
//

import UIKit


class DataHelper{
    static func registerDefault(){
        let jsonData = readLocalJSONFile(forName: "data")!
        UserDefaults.standard.register(defaults: ["parks":String.init(data: jsonData, encoding: .utf8)!,"reverations":"[]"])
    }
    static func getParks() -> [ParkField]{
        let str =  UserDefaults.standard.string(forKey: "parks")
       return  [ParkField].deserialize(from: str) as! [ParkField]
    }
    static func refreshParks(parks:[ParkField]){
        let str:String =  parks.toJSONString()!
        UserDefaults.standard.set(str , forKey: "parks")
        UserDefaults.standard.synchronize()
    }
    static func getReveration()->[Revervation]{
        let str =  UserDefaults.standard.string(forKey: "reverations")
        return  [Revervation].deserialize(from: str) as! [Revervation]
    }
    static func refreshReverations(reverations:[Revervation]){
        let str:String =  reverations.toJSONString()!
        UserDefaults.standard.set(str , forKey: "reverations")
        UserDefaults.standard.synchronize()
    }
    
    static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }

}

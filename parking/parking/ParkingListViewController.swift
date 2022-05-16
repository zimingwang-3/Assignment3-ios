//
//  ParkingListViewController.swift
//  parking
//
//  Created by Fisch on 2022/5/15.
//

import UIKit

class ParkingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct ParkingPlace:Decodable {
        var name:String
        var address:String
        var status:String
        var total:String
        var remain:String
    }
    
    var parkList = [ParkingPlace]()
    
    
    @IBOutlet weak var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonData = readLocalJSONFile(forName: "data")!
        parkList = parseData(info: jsonData)
        list.delegate = self
        list.dataSource = self
    }
    
    func parseData(info:Data) -> [ParkingPlace]{
        do {
            let decodedData = try JSONDecoder().decode([ParkingPlace].self, from: info)
            return decodedData
        }catch{
            print(error)
        }
        return []
    }
    
    
    func readLocalJSONFile(forName name: String) -> Data? {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkItem", for: indexPath) as! ParkingItemTableViewCell
        let item = parkList[indexPath.row]
        cell.name.text = item.name
        cell.address.text = item.address
        cell.status.text = item.status
        cell.total.text = item.total
        cell.remain.text = item.remain
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

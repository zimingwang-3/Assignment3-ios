//
//  ParkingListViewController.swift
//  parking
//
//  Created by Fisch on 2022/5/15.
//

import UIKit

func alert(msg:String,controller:UIViewController,okHandler: ((UIAlertAction) -> Void)? = nil){
    let  alertController =  UIAlertController (title:  "" ,
                                               message:  msg , preferredStyle: .alert )
    let  okAction =  UIAlertAction (title:  "ok" , style: .default ,
                                    handler: okHandler)
    alertController.addAction(okAction)
    controller.present(alertController, animated:  true , completion:  nil )
}


class ParkingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var user:User!
    var parkList = [ParkField]()
    var selectedIndex = 0
    var time:String!
    var date:String!
    
    @IBOutlet weak var list: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parkList = DataHelper.getParks()
        
        list.delegate = self
        list.dataSource = self
        list.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkItem", for: indexPath) as! ParkingItemTableViewCell
        let item = parkList[indexPath.row]
        cell.name.text = item.mName
        cell.address.text = item.mAddress
        cell.status.text = item.mStatus
        cell.total.text = "\(item.mTotal!)"
        let remain = item.remainCount()
        cell.remain.text = "\(remain)"
        return cell
    }
    
    
    @IBAction func bookingClick(_ sender: Any) {
        let remainCount =  parkList[selectedIndex].remainCount()
        if remainCount == 0{
            alert(msg: "no remain", controller: self)
            return
        }
        parkList[selectedIndex].bookSlot()
        let reveration =  Revervation.init(park: parkList[selectedIndex], user: user, date: date,time: time)
        var reverations =  DataHelper.getReveration()
        reverations.append(reveration)
        DataHelper.refreshParks(parks: parkList)
        DataHelper.refreshReverations(reverations: reverations)
        alert(msg: "success", controller: self) { action  in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
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

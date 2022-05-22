//
//  ReservationViewController.swift
//  parking
//
//  Created by Xueying Zou on 2022/5/19.
//

import Foundation
import UIKit

class ReservationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var selectedIndex = 0
    var datas = [Revervation]()
    override func viewDidLoad() {
        super.viewDidLoad();
        datas = DataHelper.getReveration()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationTableViewCell", for: indexPath) as! ReservationTableViewCell
        let item = datas[indexPath.row]
        cell.licensePlateLabel.text = item.user.licencesPlate
        cell.parkingPlaceLabel.text = item.park.mName
        cell.dateLabel.text = item.date
        cell.timeLabel.text = item.time
//        cell.name.text = item.mName
//        cell.address.text = item.mAddress
//        cell.status.text = item.mStatus
//        cell.total.text = "\(item.mTotal!)"
//        let remain = item.remainCount()
//        cell.remain.text = "\(remain)"
        return cell
    }
    
    @IBAction func cancelBtnClick(_ sender: Any) {
        if datas.count == 0 {
            return
        }
        
        let item  = self.datas.remove(at: self.selectedIndex)
        
        let parks =  DataHelper.getParks()
        parks.forEach { park in
            if park.mId == item.park.mId{
                park.cancelSlot()
            }
        }
        self.tableView.reloadData()
        alert(msg: "success", controller: self)
        DataHelper.refreshReverations(reverations: datas)
        DataHelper.refreshParks(parks: parks)
    }
}

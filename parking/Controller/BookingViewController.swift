//
//  BookingViewController.swift
//  parking
//
//  Created by Xueying Zou on 2022/5/18.
//

import Foundation
import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var parkingDateField: UITextField!
    @IBOutlet weak var parkingTimeButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        creatDatePicker()
        setParkingTimeButton()
        
    }
    
    func creatToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    func creatDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date()
        
        parkingDateField.inputView = datePicker
        parkingDateField.inputAccessoryView = creatToolbar()
        
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.parkingDateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func setParkingTimeButton(){
        
        let optionClosure = {(action : UIAction) in print(action.title)}
        
        parkingTimeButton.menu = UIMenu(children : [
            UIAction(title: "0:00-2:00", state: .on, handler: optionClosure),
            UIAction(title: "2:00-4:00", handler: optionClosure),
            UIAction(title: "4:00-6:00", handler: optionClosure),
            UIAction(title: "6:00-8:00", handler: optionClosure),
            UIAction(title: "8:00-10:00", handler: optionClosure),
            UIAction(title: "12:00-14:00", handler: optionClosure),
            UIAction(title: "14:00-16:00", handler: optionClosure),
            UIAction(title: "16:00-18:00", handler: optionClosure),
            UIAction(title: "18:00-20:00", handler: optionClosure),
            UIAction(title: "20:00-22:00", handler: optionClosure),
            UIAction(title: "22:00-24:00", handler: optionClosure)])
        
        parkingTimeButton.showsMenuAsPrimaryAction = true
        parkingTimeButton.changesSelectionAsPrimaryAction = true
    }
}

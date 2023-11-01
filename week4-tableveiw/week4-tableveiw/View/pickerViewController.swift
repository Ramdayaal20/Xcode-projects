//
//  pickerViewController.swift
//  week4-tableveiw
//
//  Created by ram dayaal on 26/09/23.
//

import UIKit

var viewmodel = Apps()
class pickerViewController: UIViewController {
    
    @IBOutlet weak var pickerscroll: UIPickerView!
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var versiontxt: UITextField!
    @IBOutlet weak var droptextfield: UITextField!
    @IBOutlet weak var dropbutton: UIButton!
    
    var data = ["Education", "Social Networking","Travel","News","Marketing"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerscroll.delegate = self
        pickerscroll.dataSource = self
        pickerscroll.isHidden = true
        
    }
    
    @IBAction func showdata(_ sender: Any) {
        pickerscroll.isHidden = false
        
    }
    
   
    @IBAction func savebutton(_ sender: Any) {
        var scarray = [String]()
        scarray.append(nametxt.text!)
        scarray.append(versiontxt.text!)
        scarray.append(droptextfield.text!)
        viewmodel.addApp(scarray)
        self.navigationController?.popViewController(animated: true)
    }
//    func showAlert(message: String){
//        let alert = UIAlertController(title: "Invalid", message: message, preferredStyle: .alert)
//        let act = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        alert.addAction(act)
//        self.present(alert, animated: true)
//    }
    
}
extension pickerViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        droptextfield.text = data[row]
        pickerscroll.isHidden = true
    }
    
}

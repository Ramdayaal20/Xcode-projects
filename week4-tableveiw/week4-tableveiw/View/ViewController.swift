//
//  ViewController.swift
//  week4-tableveiw
//
//  Created by ram dayaal on 25/09/23.
//

import UIKit

class ViewController: UIViewController {
  
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var table: UITableView!
    var data = ["Education", "Social Networking","Travel","News","Marketing"]
    var filterdata = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "cell", bundle: nil)
        table.register(nib  , forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
    }
    
    @IBAction func toadd(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let add = st.instantiateViewController(withIdentifier: "pickerViewController") as! pickerViewController
        self.navigationController?.pushViewController(add, animated: true)
    }
    
    @IBAction func filtershowdata(_ sender: Any) {
        picker.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    

}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Available"
        }else{
            return "updated"
        }
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return viewmodel.getCount(index: 0)
        }
        else{
            return viewmodel.getCount(index: 1)
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! cell
        if indexPath.section == 0{
            let data = viewmodel.getDetails(sectionCount: indexPath.section, indexRow:
                                                indexPath.row)
            cell.heading1.text = data[0]
            cell.heading2.text = data[1]
            cell.heading3.text = data[2]
            cell.updatebutton.tag = indexPath.row
            cell.updatebutton.isHidden = false
        }
        else{
            let secdata = viewmodel.getDetails(sectionCount: indexPath.section, indexRow:
                                                indexPath.row)
            cell.heading1.text = secdata[0]
            cell.heading2.text = secdata[1]
            cell.heading3.text = secdata[2]
            cell.updatebutton.isHidden = true
        }
        return cell
    }
}

extension ViewController : UIPickerViewDelegate,UIPickerViewDataSource{
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
        filterdata = data[row]
        picker.isHidden = true
    }
    
}

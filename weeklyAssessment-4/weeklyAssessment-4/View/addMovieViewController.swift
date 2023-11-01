//
//  addMovieViewController.swift
//  weeklyAssessment-4
//
//  Created by ram dayaal on 29/09/23.
//

import UIKit

class addMovieViewController: UIViewController {

    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var nametextfield: UITextField!
    
    @IBOutlet weak var languagelabel: UILabel!
    @IBOutlet weak var languagetextfield: UITextField!
    
    @IBOutlet weak var datalabel: UILabel!
    @IBOutlet weak var datetextfield: UITextField!
    
    @IBOutlet weak var descripylabel: UILabel!
    
    @IBOutlet weak var descripttextfield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        nametextfield.layer.cornerRadius = 27
        nametextfield.layer.masksToBounds = true
        languagetextfield.layer.cornerRadius = 27
        languagetextfield.layer.masksToBounds = true
        datetextfield.layer.cornerRadius = 27
        datetextfield.layer.masksToBounds = true
        descripttextfield.layer.cornerRadius = 27
        descripttextfield.layer.masksToBounds = true
        //navigationItem.hidesBackButton = true
        
    }
    
  
    @IBAction func savemovie(_ sender: Any) {
        guard let name = nametextfield.text , let lang = languagetextfield.text , let date = datetextfield.text , let descript = descripttextfield.text else{
            return
        }
        if ViewModel.shared.validate(name: name, lang: lang, date: date, descript: descript){
            ViewModel.shared.toAdd(moviename: name, language: lang, releasedate: date, description: descript)
            self.navigationController?.popViewController(animated: true)
        }else{
            let alert = UIAlertController(title: "Invalid", message: message, preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default)
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    
    @IBAction func cancelmovie(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    


  

}

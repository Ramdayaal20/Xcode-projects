//
//  signupViewController.swift
//  weekly assessment 3
//
//  Created by ram dayaal on 22/09/23.
//

import UIKit

protocol passData {
    func data(a : String)
}

class signupViewController: UIViewController {
    var delegate : passData?
    
    @IBOutlet weak var signupname: UITextField!
    @IBOutlet weak var signuppass: UITextField!
    @IBOutlet weak var signupmail: UITextField!
    
    
    @IBOutlet weak var submitbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        submitbutton.layer.cornerRadius = 30
        submitbutton.layer.masksToBounds = true
        signupname.layer.cornerRadius = 20
        signupname.layer.masksToBounds = true
        signuppass.layer.cornerRadius = 20
        signuppass.layer.masksToBounds = true
        signupmail.layer.cornerRadius = 20
        signupmail.layer.masksToBounds = true
        
        
       
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Invalid", message: message, preferredStyle: .alert)
        let act = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(act)
        self.present(alert, animated: true)
    }
    

    @IBAction func toLogin(_ sender: Any) {
        let name = signupname.text ?? ""
        let password =  signuppass.text ?? ""
        let mail = signupmail.text ?? ""
        
        let _ = UserDefaults.standard.set(password, forKey: "getpass")
        let _ = UserDefaults.standard.set(mail, forKey: "getmail")
        delegate?.data(a : signupname.text!)
        
        if let Name = signupname.text{
            let letterCharacterSet = CharacterSet.letters
            if Name.rangeOfCharacter(from: letterCharacterSet.inverted) != nil {
                showAlert(message: "name should only contains letters")
            }
        }
        if mail.isEmpty || password.isEmpty{
            showAlert(message: "please enter mail id and password")
        }
        else if let m = signupmail.text, m.hasSuffix("@gmail.com"){
            if let p = signuppass.text,p.count>=8{
                self.navigationController?.popToRootViewController(animated: true)
            }
            else{
                
                    showAlert(message: "Password should contain more than 7 character")
            }
        }
        else{
            if signupmail.text=="" && signuppass.text==""{
                showAlert(message: "Please enter Email and Password")
            }
            else{
                showAlert(message: "Please enter valid email id")
            }
        }
        
       
    }
}


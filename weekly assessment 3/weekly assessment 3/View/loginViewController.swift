//
//  loginViewController.swift
//  weekly assessment 3
//
//  Created by ram dayaal on 22/09/23.
//

import UIKit

class loginViewController: UIViewController {
    var name = ""
    @IBOutlet weak var loginMail: UITextField!
    @IBOutlet weak var loginpass: UITextField!
    @IBOutlet weak var loginbutton: UIButton!
    
    @IBOutlet weak var signupbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginbutton.isEnabled = false
        loginbutton.layer.cornerRadius = 27
        loginbutton.layer.masksToBounds = true
        signupbutton.layer.cornerRadius = 27
        signupbutton.layer.masksToBounds = true
        loginMail.layer.cornerRadius = 30
        loginMail.layer.masksToBounds = true
        loginpass.layer.cornerRadius = 30
        loginpass.layer.masksToBounds = true
       
    }
    
    @IBAction func toApp(_ sender: Any) {
        let loginmail = loginMail.text ?? ""
        let loginpass = loginpass.text ?? ""
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let app = storyboard.instantiateViewController(withIdentifier: "appViewController") as! appViewController
        let getmail = UserDefaults.standard.string(forKey: "getmail")
        let getpass = UserDefaults.standard.string(forKey: "getpass")
        app.getname = name
        
        if loginmail == getmail && loginpass == getpass{
            self.navigationController?.pushViewController(app, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Invalid", message: "mail or password incorrect", preferredStyle: .alert)
            let act = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(act)
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func toSignup(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signup = storyboard.instantiateViewController(withIdentifier: "signupViewController") as! signupViewController
        signup.delegate = self
        self.navigationController?.pushViewController(signup, animated: true)
    }
}

extension loginViewController : passData{
    func data (a : String){
        name = a
        loginbutton.isEnabled = true
    }
}

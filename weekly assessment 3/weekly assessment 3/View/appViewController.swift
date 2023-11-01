//
//  appViewController.swift
//  weekly assessment 3
//
//  Created by ram dayaal on 22/09/23.
//

import UIKit

class appViewController: UIViewController {
    
    var getname = ""
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Welcome \(getname)"
       
    }
    

  

}

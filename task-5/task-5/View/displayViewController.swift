//
//  displayViewController.swift
//  task-5
//
//  Created by ram dayaal on 04/10/23.
//

import UIKit

class displayViewController: UIViewController {

    @IBOutlet weak var imgview: UIImageView!
    var img : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        imgview.image = img

    }
    

  
}

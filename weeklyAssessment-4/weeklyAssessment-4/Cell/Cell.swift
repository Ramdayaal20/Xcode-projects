//
//  Cell.swift
//  weeklyAssessment-4
//
//  Created by ram dayaal on 29/09/23.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet var movienamelabel : UILabel!
    @IBOutlet var laguagelabel : UILabel!
    @IBOutlet var datelabel :UILabel!
    @IBOutlet var descriptionlabel : UILabel!
    
    var changebutton = false
    @IBOutlet weak var favouritebutton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
    @IBAction func favbutton(_ sender: Any) {
        if changebutton == false {
            favouritebutton.setImage(UIImage(named: "fav"), for: .normal)
            changebutton = true
        }else{
            favouritebutton.setImage(UIImage(named: "unfav"), for: .normal)
            changebutton = false
        }

    }

}

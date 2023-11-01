//
//  cell.swift
//  week4-tableveiw
//
//  Created by ram dayaal on 25/09/23.
//

import UIKit



class cell: UITableViewCell {
    @IBOutlet weak var updatebutton: UIButton!
    @IBOutlet weak var heading3: UILabel!
    @IBOutlet weak var heading2: UILabel!
    @IBOutlet weak var heading1: UILabel!
    @IBOutlet weak var symbol: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func updatebutton(_ sender: Any) {
        
        let rowData = (sender as AnyObject).tag!
        let dataCopy = viewmodel.notupdated.remove(at: rowData)
        viewmodel.updated.append(dataCopy)
        
        if let tb = superview as? UITableView{
            tb.reloadData()
        }
       
    }
}

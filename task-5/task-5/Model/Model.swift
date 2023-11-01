//
//  Model.swift
//  task-5
//
//  Created by ram dayaal on 03/10/23.
//

import Foundation
import UIKit

var arrind = 0
class albumData {
    var name : String
    var image : [UIImage] = []
    
    init(name: String) {
        self.name = name
        
    }
    func getData() -> [String]{
        var arr = [String]()
        arr.append(name)
        return arr
    }
    
    func addimg (img : UIImage){
        image.append(img)
    }
    
    func getimgcount() -> Int {
        return image.count
    }
    
    func displayimage() -> [UIImage] {
        return image
    }

}

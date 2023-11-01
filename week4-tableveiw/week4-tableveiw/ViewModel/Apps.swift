//
//  Apps.swift
//  week4-tableveiw
//
//  Created by ram dayaal on 26/09/23.
//

import Foundation

class Apps{
    var updated = [AppModel]()
    var notupdated = [AppModel]()
    func addApp(_ arr:[String])
    {
        //print("Came here")
        notupdated.append(AppModel(arr))
    }
    func getCount(index: Int) -> Int{
        if index == 0{
            return notupdated.count
        }
        else{
            return updated.count
        }
    }
    func getDetails(sectionCount: Int, indexRow :Int) -> [String]
    {
        if sectionCount == 0 {
            return notupdated[indexRow].getData()
        }
        else {
            return updated[indexRow].getData()
        }
    }
    
    
    
}

//
//  AppModel.swift
//  week4-tableveiw
//
//  Created by ram dayaal on 26/09/23.
//

import Foundation
class AppModel{
    let name:String
    let version:String
    let category:String
    
    init(_ arr:[String]){
        name = arr[0]
        version = arr[1]
        category = arr[2]
    }
    func getData() -> [String]
    {
        var array = [String]()
        array.append(name)
        array.append(version)
        array.append(category)
        return array
    }
}

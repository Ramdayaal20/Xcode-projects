//
//  ViewModel.swift
//  weeklyAssessment-4
//
//  Created by ram dayaal on 29/09/23.
//

import Foundation
var message = ""
class ViewModel {
    static let shared = ViewModel()
    var movie = [moviesData]()
    
    
    func getData(index : Int) -> [String]{
        return movie[index].getAsarr()
    }
    
    func toAdd(moviename : String , language : String , releasedate : String , description : String)
    {
        movie.append(moviesData(moviename: moviename, movielanguage: language, releasedate: releasedate, moviedescription: description))
    }
    
    func validate(name : String , lang : String , date : String , descript : String) -> Bool
    {
        if name.isEmpty || lang.isEmpty || date.isEmpty || descript.isEmpty{
            message = "fill all the fields"
            return false
        }
        else{
            let dateform = date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            if let date = dateFormatter.date(from: dateform) {
                return true
            } else {
                message = "please enter valid date"
                return false
            }

           
        }
    }
}

//
//  Model.swift
//  weeklyAssessment-4
//
//  Created by ram dayaal on 29/09/23.
//

import Foundation

class moviesData{
    var moviename : String
    var movielanguage : String
    var releasedate : String
    var moviedescription : String
    
    init(moviename: String, movielanguage: String, releasedate: String, moviedescription: String) {
        self.moviename = moviename
        self.movielanguage = movielanguage
        self.releasedate = releasedate
        self.moviedescription = moviedescription
    }
    
    func getAsarr() -> [String]{
        var arr = [String]()
        arr.append(moviename)
        arr.append(movielanguage)
        arr.append(releasedate)
        arr.append(moviedescription)
        return arr
    }
}

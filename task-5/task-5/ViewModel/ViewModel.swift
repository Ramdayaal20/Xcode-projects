//
//  ViewModel.swift
//  task-5
//
//  Created by ram dayaal on 03/10/23.
//

import Foundation
import PhotosUI
class AlbumsViewModel {
    var albums = [albumData]()

    func addAlbum(album: String) {
        albums.append(albumData(name: album))
    }

    func deleteAlbum(index: Int) -> [String] {
        return albums[index].getData()
    }
    
    func addalb(ind : Int , img : UIImage) {
        albums[ind].addimg(img :img)
    }
    
    func getalbcount (ind : Int) -> Int {
        return albums[ind].getimgcount()
    }
    
    func display (ind : Int) -> [UIImage] {
        return albums[ind].displayimage()
    }
    func getresult(ind : Int) -> [UIImage]{
        return albums[ind].displayimage()
    }

}

//
//  ViewController.swift
//  task-5
//
//  Created by ram dayaal on 03/10/23.
//

import UIKit
var model = AlbumsViewModel()
class ViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "myCollectionViewCell", bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: "myCollectionViewCell")
        collectionview.delegate = self
        collectionview.dataSource = self
    }

    @IBAction func addalbum(_ sender: Any) {
        let alert = UIAlertController(title: "album name", message: nil, preferredStyle: .alert)
        alert.addTextField{ textField in
            textField.placeholder = "enter album name"
        }
        let save = UIAlertAction(title: "save", style: .default)
        { action in
            if let Name = alert.textFields?.first?.text, !Name.isEmpty{
                model.addAlbum(album: Name)
                self.collectionview.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "cancel", style: .default,handler: nil)
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true)
    }
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let sec = st.instantiateViewController(withIdentifier: "photoViewController") as! photoViewController
        arrind = indexPath.row
        self.navigationController?.pushViewController(sec, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionViewCell", for: indexPath) as! myCollectionViewCell
        let data = model.deleteAlbum(index: indexPath.row)
        cell.albname.text = data[0]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
}

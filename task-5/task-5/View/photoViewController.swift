//
//  photoViewController.swift
//  task-5
//
//  Created by ram dayaal on 04/10/23.
//

import UIKit
import PhotosUI
var phmodel = [albumData]()
class photoViewController: UIViewController {
    @IBOutlet weak var phcollectionview: UICollectionView!
    var imgarr = [UIImage]()
    @IBOutlet weak var cancelbutton: UIBarButtonItem!
    @IBOutlet weak var addbutton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "photocell", bundle: nil)
        phcollectionview.register(nib, forCellWithReuseIdentifier: "photocell")
        phcollectionview.delegate = self
        phcollectionview.dataSource = self
//        if #available(iOS 16.0, *) {
//            navigationItem.leftBarButtonItem?.isHidden = true
//        } else {
//            // Fallback on earlier versions
//        }
    }
    

 
    @IBAction func addimg(_ sender: Any) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        let phpcikvc = PHPickerViewController(configuration: config)
        phpcikvc.delegate = self 
        self.present(phpcikvc, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
}

extension photoViewController : PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self){ object,error in
                if let image = object as? UIImage{
                    model.addalb(ind: arrind, img: image)
                }
                DispatchQueue.main.async {
                    self.phcollectionview.reloadData()
                }
                
            }
        }
    }
    
}

extension photoViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getalbcount(ind : arrind)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photocell", for: indexPath) as! photocell
        cell.dispimage.image = model.display(ind : arrind)[indexPath.row]
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let story = st.instantiateViewController(withIdentifier: "displayViewController") as! displayViewController
        let  ind = indexPath.row
        let image = model.getresult(ind: arrind)
        story.img = image[ind]
        self.navigationController?.pushViewController(story, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: phcollectionview.frame.size.width/3, height: phcollectionview.frame.size.width/5 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}


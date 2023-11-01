//
//  ViewController.swift
//  weeklyAssessment-4
//
//  Created by ram dayaal on 29/09/23.
//

import UIKit
//var ViewModel.shared = ViewModel()
class ViewController: UIViewController {

    @IBOutlet weak var nomovieslabel: UILabel!
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.isHidden = true
        let nib = UINib(nibName: "Cell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ViewModel.shared.movie.sort{$0.releasedate > $1.releasedate}
        table.reloadData()
    }

    @IBAction func addmovie(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let toadd = st.instantiateViewController(withIdentifier: "addMovieViewController") as! addMovieViewController
        self.navigationController?.pushViewController(toadd, animated: true)
    }
    
}

// MARK: - Extension For Table

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.shared.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let data = ViewModel.shared.getData(index: indexPath.row)
        cell.movienamelabel.text = data[0]
        cell.laguagelabel.text = data[1]
        cell.datelabel.text = data[2]
        cell.descriptionlabel.text = data[3]
//        cell.favouritebutton.setImage(UIImage(named: "Ellipse 4"), for: .normal)
//        cell.favouritebutton.tag = indexPath.row
        table.isHidden = false
        return cell
    }
}


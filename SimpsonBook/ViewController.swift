//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Cem Eke on 23.01.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(_name: "Homer", _job: "Öğretmen", _image: UIImage(named:"homer")!)
        let bart = Simpson(_name: "Bart", _job: "Öğrenci", _image: UIImage(named:"bart")!)
        let marge = Simpson(_name: "Marge", _job: "Ev Hanımı", _image: UIImage(named:"marge")!)
        let lisa = Simpson(_name: "Lisa", _job: "Sekreter", _image: UIImage(named:"lisa")!)
        let maggie = Simpson(_name: "Maggie", _job: "NoJob", _image: UIImage(named:"maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(marge)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        performSegue(withIdentifier: "todetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "todetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
    
        }
    }
}


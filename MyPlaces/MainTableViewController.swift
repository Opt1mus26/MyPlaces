//
//  MainTableViewController.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 21.12.2021.
//

import UIKit

class MainTableViewController: UITableViewController {

//    var places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        places.count
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
//        let place = places[indexPath.row]
//
//        cell.configure(with: place)
//
//
//        return cell
//    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else { return }
        newPlaceVC.saveNewPlace()
//        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

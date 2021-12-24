//
//  MainTableViewController.swift
//  MyPlaces
//
//  Created by Pavel Tsyganov on 21.12.2021.
//

import RealmSwift

class MainTableViewController: UITableViewController {

    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.isEmpty ? 0 : places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let place = places[indexPath.row]

        cell.configure(with: place)


        return cell
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let place = places[indexPath.row]
                StorageManager.deleteObject(place)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else { return }
        newPlaceVC.saveNewPlace()
        tableView.reloadData()
    }

    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

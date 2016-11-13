//
//  SelectKioskTableViewController.swift
//  EcoKitcheniOS
//
//  Created by mh53653 on 11/13/16.
//  Copyright © 2016 madan. All rights reserved.
//

import UIKit

class SelectKioskTableViewController: UITableViewController {

    private var locations = [Location]()
    var selectionLocation: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = ServiceManager()
        manager.allLocations { (locations) in
            DispatchQueue.main.async {
                self.locations = locations
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KioskCellIdentifier")
        
        let address = locations[indexPath.row].address
        
        cell?.textLabel?.text = address
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectionLocation = locations[indexPath.row]
        performSegue(withIdentifier: "ExitSegueIdentifier", sender: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if selectionLocation != nil {
            return true
        }
        return false
    }
    
}

//
//
//  StateListTableViewController.swift
//  Representative27
//
//  Created by Leah Cluff on 6/27/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stateSearchSegue" {
            guard let destinationVC = segue.destination as? StateDetailTableViewController, let index = tableView.indexPathForSelectedRow else { return }
            
            destinationVC.state = States.all[index.row]
        }
    }
}



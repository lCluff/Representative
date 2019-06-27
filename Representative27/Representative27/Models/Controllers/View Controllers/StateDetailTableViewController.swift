//
//  StateDetailTableViewController.swift
//  Representative27
//
//  Created by Leah Cluff on 6/27/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representatives: [Representative] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        title = state
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) {
                (repArray) in self.representatives = repArray
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else
        {return UITableViewCell()}
        cell.representative = representatives[indexPath.row]
        
        return cell
    }
}

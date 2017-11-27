//
//  StatesListTableViewController.swift
//  Representatives
//
//  Created by Kudryatzhan Arziyev on 11/27/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class StatesListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return States.all.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateTableViewCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = States.all[indexPath.row]

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailTableVC" {
            if let destinationVC = segue.destination as? StateDetailTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    destinationVC.state = States.all[indexPath.row]
                }
            }
        }
    }
    
}

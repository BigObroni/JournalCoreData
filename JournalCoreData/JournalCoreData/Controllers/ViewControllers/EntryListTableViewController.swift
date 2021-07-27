//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Nevan Bingham on 7/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EntryController.shared.fetchEntries()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title
        cell.detailTextLabel?.text = entry.bodyText
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEntryList" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController
            else {return}
            let entry = EntryController.shared.entries[indexPath.row]
            destination.entry = entry
        }
    }
}


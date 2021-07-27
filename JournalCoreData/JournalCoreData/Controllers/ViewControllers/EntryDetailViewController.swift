//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Nevan Bingham on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    var entry: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let bodyText = bodyTextView.text, !bodyText.isEmpty else {return}
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry, title: title, bodyText: bodyText, timeStamp: Date())
        } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyText, timeStamp: Date())
        }
       
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = " "
        bodyTextView.text = " "
    }
    
    func updateViews() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
}

//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Jenny Morales on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    //MARK: - Properties
    var entry: Entry?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty,
              let bodyText = bodyTextView.text, !bodyText.isEmpty else { return }
        if let entry = entry {
            entry.title = title
            entry.bodyText = bodyText
            EntryController.shared.updateEntry(entry)
        } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyText)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        titleTextField.text = ""
        bodyTextView.text = ""
        titleTextField.resignFirstResponder()
    }
    //MARK: - Functions
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
}//End of class

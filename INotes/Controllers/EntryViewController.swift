//
//  EntryViewController.swift
//  INotes
//
//  Created by ABDIHAKIN ELMI on 23/09/20.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var noteField: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    public var comletion: ((String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTabSave))
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM yyyy HH:mm"
        let result = formatter.string(from: date)
        dateLabel.text = result
    }

    
    @objc func didTabSave(){
     
     
        
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty {
            comletion?(text, noteField.text)
        }
    }
    
    
}

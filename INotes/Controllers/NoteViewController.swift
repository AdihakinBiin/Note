//
//  NoteViewController.swift
//  INotes
//
//  Created by ABDIHAKIN ELMI on 23/09/20.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    
   public var noteTitle: String = ""
   public var note: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = noteTitle
        noteLabel.text = note
       
    }
    
    @IBAction func didTabShare(){
        
    }

}

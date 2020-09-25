//
//  ViewController.swift
//  INotes
//
//  Created by ABDIHAKIN ELMI on 23/09/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var note: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        table.delegate = self
        table.dataSource = self
        
    }

    @IBAction func didTabAddNew(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
         return
        }
       
        vc.title = "biin"
        vc.comletion = {note, table  in
            self.navigationController?.popToRootViewController(animated: true)
            self.models.append((title: table, note: note))
            self.note.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {
            return
        }
        vc.title = "notes"
        navigationItem.largeTitleDisplayMode = .never
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    

}


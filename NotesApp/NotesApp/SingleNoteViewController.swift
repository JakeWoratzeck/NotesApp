//
//  SingleNoteViewController.swift
//  NotesApp
//
//  Created by Jake Woratzeck on 11/26/17.
//  Copyright © 2017 Jake Woratzeck. All rights reserved.
//

import UIKit

class SingleNoteViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    var existingNote: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        bodyTextField.delegate = self
        
        titleTextField.text = existingNote?.title
        bodyTextField.text = existingNote?.body
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func saveNote(_ sender: Any) {
        let title = titleTextField.text
        let body = bodyTextField.text
        
        var note: Note?
        
        if let existingNote = existingNote {
            existingNote.title = title
            existingNote.body = body
            
            note = existingNote
        } else {
            note = Note(title: title, body: body)
        }
    
        if let note = note {
            do {
                let managedContext = note.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Context could not be saved")
            }
        }
    }
}

extension SingleNoteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


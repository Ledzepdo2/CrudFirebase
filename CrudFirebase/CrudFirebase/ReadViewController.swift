//
//  ReadVIewController.swift
//  CrudFirebase
//
//  Created by Jesus Perez Mojica on 06/05/22.
//

import UIKit
import FirebaseFirestore

class ReadViewController: UIViewController {
    
    var data :  String = ""
    let db = Firestore.firestore()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = data
        
        db.collection("users").document(data).getDocument{
            (DocumentSnapshot, error) in
            
            if let document = DocumentSnapshot, error == nil {
                if let name = document.get("name") as? String {
                    self.nameTextField.text = name
                }
                if let password = document.get("password") as? String {
                    self.passwordTextField.text = password
                }
            }
        }
    }
    
    
    @IBAction func ModifyButton(_ sender: UIButton) {
        
        
        db.collection("users").document(data).updateData([
            "name": nameTextField.text ?? "",
            "password": passwordTextField.text ?? "",
            "email" : emailTextField.text ?? ""])
        { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        db.collection("users").document(data).getDocument{
            (DocumentSnapshot, error) in
            
            if let document = DocumentSnapshot, error == nil {
                if let name = document.get("name") as? String {
                    self.nameTextField.text = name
                }
                if let password = document.get("password") as? String {
                    self.passwordTextField.text = password
                }
            }
        }
        
        
        
    }
    
    @IBAction func DeleteButton(_ sender: UIButton) {
        db.collection("users").document(data).delete()
        
        emailTextField.text = "Has eliminado tus datos."
        nameTextField.text = "Has eliminado tus datos."
        passwordTextField.text = "Has eliminado tus datos."
        
    }
    
}



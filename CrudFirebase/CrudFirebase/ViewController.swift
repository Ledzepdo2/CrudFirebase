//
//  ViewController.swift
//  CrudFirebase
//
//  Created by Jesus Perez Mojica on 05/05/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let db = Firestore.firestore()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        
        
    }

    @IBAction func registerButton(_ sender: UIButton) {
        
        print("hola esta es la base de datos \(db)")
        
        db.collection("users").document(emailTextField.text ?? "").setData([
            "email": emailTextField.text ?? "",
            "name": nameTextField.text ?? "",
            "password" : passwordTextField.text ?? ""
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let readView = segue.destination as? ReadViewController
        readView?.data = emailTextField.text ?? "El dato no se envio"
    }
    
}


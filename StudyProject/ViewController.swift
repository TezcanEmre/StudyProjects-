//
//  ViewController.swift
//  StudyProject
//
//  Created by Tezcan on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel! // username label
    @IBOutlet weak var passwordLabel: UILabel! // password label
    @IBOutlet weak var passwordCheckLabel: UILabel! // password check message label
    @IBOutlet weak var defaultLabel1: UILabel! // username mesaage label
    @IBOutlet weak var defaultLabel2: UILabel! // password message label
    @IBOutlet weak var savedDataLabel1: UILabel! //showing user's username label
    @IBOutlet weak var savedDataLabel2: UILabel! // showing user's password label
    @IBOutlet weak var usernameTextField: UITextField! // username choosing text field
    @IBOutlet weak var passwordTextField: UITextField! // password choosing text field
    @IBOutlet weak var passwordCheckTextField: UITextField! // checking for password text label
    
    
    
    var transferData = "" // this varriable for transfering data for second VC
    var counter = 0 // this counter is for how many time user make sign up
    func alertFunc2 (situationalTitle2: String, situationalMessage2: String){ //If user wants delete profile this alert function will be appear and asking are you sure about the deleting saved user profile
        let warningMessage2 = UIAlertController(title: situationalTitle2, message: situationalMessage2, preferredStyle: UIAlertController.Style.alert)
        let noButton = UIAlertAction(title: "No :(", style: UIAlertAction.Style.default)
        let yesButton = UIAlertAction(title: "Yes.", style: UIAlertAction.Style.default) { (UIAlertAction) in
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
            // if user choose deleting profile info this code clearing the labels
            self.savedDataLabel1.text = ""
            self.savedDataLabel2.text = ""
        }
        warningMessage2.addAction(yesButton)
        warningMessage2.addAction(noButton)
        self.present(warningMessage2, animated: true, completion: nil)
    }
   
    
    func alertFunc (situationalTitle: String, situationalMessage: String){ // If user succeed to sign up, this alert function showing processing succesfully
        let warningMessage = UIAlertController(title: situationalTitle, message: situationalMessage, preferredStyle: UIAlertController.Style.alert)
       let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        warningMessage.addAction(okButton)
        
        
        self.present(warningMessage, animated: true, completion: nil)
    }
    //these are for save user datas in UserDefaults. Also saving counter for showing how many time user sign up
    let savedUserData1 = UserDefaults.standard.object(forKey: "username")
    let savedUserData2 = UserDefaults.standard.object(forKey: "password")
    let counterData = UserDefaults.standard.integer(forKey: "counterData")
    //let counterTempData = UserDefaults.standard.integer(forKey: "tempCounter")
     
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) // this code makes touching anywhere except texfield is closing keyboard
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // every time view did load show last saved data
        if let checkpoint = savedUserData1 as? String {
            savedDataLabel1.text = "\(checkpoint)"}
        if let checkpoint2 = savedUserData2 as? String {
            savedDataLabel2.text = "\(checkpoint2)"}
        
      
       
        
    }
    @IBAction func signUpButton(_ sender: Any) {
        // this code block checking user datas are filled or not. If filled progressing successed if not showing error messages.
        if (usernameTextField.text == "") {
            alertFunc(situationalTitle: "Error!", situationalMessage: "You can't leave username empty.")}
        else if (passwordTextField.text == "") {
            alertFunc(situationalTitle: "Error!", situationalMessage: "You can't leave password empty.")}
        else if (passwordCheckTextField.text == "") {
            alertFunc(situationalTitle: "Error!", situationalMessage: "You can't leave this empty.")}
        else if (passwordCheckTextField.text != passwordTextField.text ) {
            alertFunc(situationalTitle: "Error!", situationalMessage: "Passwords doesn't match.")
        }
        else {
            alertFunc(situationalTitle: "Congratulations!", situationalMessage: "Your data stored succesfully!")
            savedDataLabel1.text = usernameTextField.text
            savedDataLabel2.text = passwordTextField.text
            UserDefaults.standard.set(usernameTextField.text, forKey: "username")
            UserDefaults.standard.set(passwordTextField.text, forKey: "password")
            // if sign up progress successed counter count how many time user sign up, Its not work properly Im trying to fix it
            if counter > 0 {
                counter += 1
                print(counter)
                UserDefaults.standard.set(counter, forKey: "counterData")
                transferData = String(counter)
                }
            else if counter == 0 {
                counter = UserDefaults.standard.integer(forKey: "counterData")
                print(counter)
                counter += 1
                UserDefaults.standard.set(counter, forKey: "counterData")
                transferData = String(counter)
            }
            
            
        }}
    
    
    @IBAction func deleteUserData(_ sender: Any) {
       alertFunc2(situationalTitle2: "What?", situationalMessage2: "Are you leaving me? :(")
        }
    

    @IBAction func toSecondVCButton(_ sender: Any) {
        //transferData = String(counter)
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let destinationVC = segue.destination as! secondViewController
            destinationVC.counterData2 = transferData
        }
        
        
    }
    
    
}


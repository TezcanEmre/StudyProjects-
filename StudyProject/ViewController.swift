//
//  ViewController.swift
//  StudyProject
//
//  Created by Tezcan on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordCheckLabel: UILabel!
    @IBOutlet weak var defaultLabel1: UILabel! //Your username label ı
    @IBOutlet weak var defaultLabel2: UILabel! //Your password label ı
    @IBOutlet weak var savedDataLabel1: UILabel!// username gösteren görünmez label
    @IBOutlet weak var savedDataLabel2: UILabel!// password u gösteren görünmez label
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    var transferData = "" // ikinci VC'ye sayaç verisini aktarmak için string
    var counter = 0 // sayaç verisi if kontrolünde arttırmak için int
    func alertFunc2 (situationalTitle2: String, situationalMessage2: String){
        let warningMessage2 = UIAlertController(title: situationalTitle2, message: situationalMessage2, preferredStyle: UIAlertController.Style.alert)
        let noButton = UIAlertAction(title: "No :(", style: UIAlertAction.Style.default)
        let yesButton = UIAlertAction(title: "Yes.", style: UIAlertAction.Style.default) { (UIAlertAction) in
            UserDefaults.standard.removeObject(forKey: "username")
            UserDefaults.standard.removeObject(forKey: "password")
            self.savedDataLabel1.text = ""
            self.savedDataLabel2.text = ""
        }
        warningMessage2.addAction(yesButton)
        warningMessage2.addAction(noButton)
        self.present(warningMessage2, animated: true, completion: nil)
    }
    //yukarıdaki fonksiyon kayıtlı verileri silmek için uyarı fonksiyonu, sil butonuna basılınca label temziliyor user defaultsdan da siliyor
    
    func alertFunc (situationalTitle: String, situationalMessage: String){
        let warningMessage = UIAlertController(title: situationalTitle, message: situationalMessage, preferredStyle: UIAlertController.Style.alert)
       let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        warningMessage.addAction(okButton)
        
        
        self.present(warningMessage, animated: true, completion: nil)
    }
    // yukarıdaki fonksiyon önce textboxları kontrol ediyor, hata varsa uyarıyor yoksa kaydedildiğini belirtiyor
    let savedUserData1 = UserDefaults.standard.object(forKey: "username")
    let savedUserData2 = UserDefaults.standard.object(forKey: "password")
    let counterData = UserDefaults.standard.integer(forKey: "counterData")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let checkpoint = savedUserData1 as? String {
            savedDataLabel1.text = "\(checkpoint)"}
        if let checkpoint2 = savedUserData2 as? String {
            savedDataLabel2.text = "\(checkpoint2)"}
       
        // Uygulama açıldığında kayıtlı veri varsa yazdırıyor
    }
    @IBAction func signUpButton(_ sender: Any) {
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
            if counter > 0 {
                counter = counter + 1
                print(counter)
                UserDefaults.standard.set(counter, forKey: "counterData")
                }
            else if counter == 0 {
                counter = counterData
                print(counter)
                counter = counter + 1
                UserDefaults.standard.set(counter, forKey: "counterData")
            }
            
            
        }}
    //kayıt ol tuşuna basıldığında alarm fonksiyonlarına gerekli uyarıyı yazdırıyor hata yoksa verileri kaydediyor. Sorun burada sanırım çünkü kaydedilen toplam veri için sayaç tutmak istiyorum ancak sayaç stabil çalışmıyor.
    
    @IBAction func deleteUserData(_ sender: Any) {
       alertFunc2(situationalTitle2: "What?", situationalMessage2: "Are you leaving me? :(")
        }
    //"Lemme out" butonuna bağlı, eğer uyarı mesajı onaylanırsa fonksiyondaki veri silme işlemi yapılıyor.

    @IBAction func toSecondVCButton(_ sender: Any) {
        
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
        transferData = String(counterData)
    }
    // burada sayaç verisini ikinci VC ye göndermeye çalıştım
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! secondViewController
        destinationVC.GelenVeri1 = transferData
        
        
    }
    @IBAction func counterReset(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "counterData")
        UserDefaults.standard.set(0, forKey: "counterData")
        print(counterData)
    }
    //burada sayaç stabil çalışmadığı için sıfırlamak istedim ancak çalışmıyor.
}


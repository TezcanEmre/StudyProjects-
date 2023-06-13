//
//  secondViewController.swift
//  StudyProject
//
//  Created by Tezcan on 10.06.2023.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var secondVCmainLabel: UILabel!
    @IBOutlet weak var sysQuestionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    var counterData2 = ""
    let savedCounter = UserDefaults.standard.object(forKey: "counter")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempLabel.text = counterData2
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

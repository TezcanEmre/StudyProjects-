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
       
    }
    

    

}

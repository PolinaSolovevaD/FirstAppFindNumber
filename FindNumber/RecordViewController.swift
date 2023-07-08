//
//  RecordViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 8/7/23.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var recordLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let record = UserDefaults.standard.integer(forKey: KeysUserDefaults.recordsGame)
        if record != 0 {
            recordLable.text = "Your record - \(record)"
        } else {
            recordLable.text = "No record yet"
        }
    }
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

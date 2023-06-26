//
//  RedViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 26/6/23.
//

import UIKit

class RedViewController: UIViewController {

    
    @IBOutlet weak var testLable: UILabel!
    var textForLable = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLable.text = textForLable

    }
    @IBAction func goToGreenController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "greenVC") as? GreenViewController {
            vc.textForLable = "Text String"
            vc.title = "Green"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}


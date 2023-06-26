//
//  YellowViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 26/6/23.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("YellowViewController viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("YellowViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("YellowViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("YellowViewController viewWillDisappear")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("YellowViewController viewDidDisappear")
    }
    
    deinit {
        print("YellowViewController deinit")
    }
    
    @IBAction func goToRedController(_ sender: Any) {
        performSegue(withIdentifier: "goToRed", sender: "Test String")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToRed":
            if let redVc = segue.destination as? RedViewController {
                if let string = sender as? String{
                    redVc.textForLable = "Test String"
                }
            }
        default:
            break
        }
    }
}

//
//  SettingsTableViewController.swift
//  FindNumber
//
//  Created by Polya Soloveva on 1/7/23.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var switchTimer: UISwitch!
    @IBOutlet weak var timeGameLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSattings.timerState = sender.isOn
    }
    
    func loadSettings() {
        timeGameLable.text = "\(Settings.shared.currentSattings.timeForGame) sec"
        switchTimer.isOn = Settings.shared.currentSattings.timerState
    }
    
    @IBAction func resetSettings(_ sender: Any) {
        Settings.shared.resetSettings()
        loadSettings()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "selectTimeVC":
            if let vc = segue.destination as? SelectTimeViewController{
                vc.data = [10,20,30,40,50,60,70,80,90,100,110,120]
            }
        default:
            break
        }
    }
}

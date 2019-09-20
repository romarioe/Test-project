//
//  SettingsTableViewController.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 18/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController, UITextFieldDelegate {
    

    @IBOutlet weak var SchemeControl: UISegmentedControl!
    @IBOutlet weak var ServerField: UITextField!
    @IBOutlet weak var EndpointField: UITextField!
    @IBOutlet weak var TokenField: UITextField!
    @IBOutlet weak var IntervalField: UITextField!
    @IBOutlet weak var SetDefaultButton: UIButton!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var AuthSwitch: UISwitch!
    
    
    
    let authIndexPath = IndexPath(row: 4, section: 0)
    let buttonsRow = IndexPath(row: 6, section: 0)
    
    var authFieldShown: Bool = false{
        didSet{
            TokenField.isHidden = !authFieldShown
        }
    }
    
    
    let settings = Settings()
    
    var scheme = "https"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ServerField.delegate = self
        self.EndpointField.delegate = self
        self.TokenField.delegate = self
        self.IntervalField.delegate = self
        
         SetDefaultButton.layer.cornerRadius = 15
         SaveButton.layer.cornerRadius = 15
        
        self.readSettings()
    }
    
    
    @IBAction func SchemeControl(_ sender: Any) {
       self.detectScheme()
    }
    
    
    func detectScheme(){
        switch SchemeControl.selectedSegmentIndex
        {
        case 0:
            scheme = "https"
        case 1:
            scheme = "http"
        default:
            break;
        }
    }
    
    
    
    func readSettings(){
            if settings.getScheme() == "https" {
                SchemeControl.selectedSegmentIndex = 0
            } else if settings.getScheme() == "http"{
                SchemeControl.selectedSegmentIndex = 1
            }
            ServerField.text = settings.getHost()
            EndpointField.text = settings.getPath()
            TokenField.text = settings.getToken()
            if settings.getToken() != "" {
                AuthSwitch.isOn = true
                authFieldShown.toggle()
            }
            IntervalField.text = String(settings.timeInterval())
    }
    
    
    
    func defaultSettings(){
        SchemeControl.selectedSegmentIndex = 0
        ServerField.text = settings.defaultHost
        EndpointField.text = settings.defaultPath
        TokenField.text = settings.defaultToken
        AuthSwitch.isOn = false
        authFieldShown = false
        tableView.beginUpdates()
        tableView.endUpdates()
        IntervalField.text = settings.defaultTimeIntarval
    }
    
    
    
    @IBAction func BackToDefault(_ sender: Any) {
        self.defaultSettings()
    }

    @IBAction func Save(_ sender: Any) {
        self.detectScheme()
        if settings.checkURL(scheme: scheme, server: ServerField.text!, endpoint: EndpointField.text!) == false {
            let alert = UIAlertController(title: "Error", message: "URL is not valid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Edit", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            settings.saveSettings(scheme: scheme, server: ServerField.text!, endpoint: EndpointField.text!, token: TokenField.text!, timeInterval: IntervalField.text!)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBAction func AuthSwitch(_ sender: UISwitch) {
        if authFieldShown == false {
            authFieldShown.toggle()
            
        } else {
            TokenField.text = ""
            authFieldShown.toggle()
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    
    //MARK: -- Hide keyboard Action
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


extension SettingsTableViewController{
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{

        case authIndexPath:
            return   authFieldShown ? 44 : 0
        case buttonsRow:
            return   80
        default:
            return 48
        }
    }
}



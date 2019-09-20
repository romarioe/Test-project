//
//  ViewController.swift
//  KubanTestProject
//
//  Created by Roman Efimov on 17/09/2019.
//  Copyright © 2019 Roman Efimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var StatusLogFields: UITextView!
    @IBOutlet weak var ConnectButton: UIButton!
    @IBOutlet weak var CircleView: UIView!
    
    var timer: Timer?
    var circles = Circles()
    
    let networkService = NetworkService()
    let settings = Settings()
    let responseCodes = ResponseCodes()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectButton.layer.cornerRadius = ConnectButton.bounds.size.width / 2.0
    }
    
    
    func drawTrack(){
        let track = circles.drawTrakLayer(center: ConnectButton.center , radius: 55)
        track.name = "track"
        view.layer.addSublayer(track)
    }
    
    func removeTrack(){
       view.layer.sublayers?.first(where: { $0.name == "track"})?.removeFromSuperlayer()
    }
    
    func drawCircle(){
        let shape = circles.drawShapeLayer(center: ConnectButton.center, radius: 55, timeInterval: settings.timeInterval())
        shape.name = "shape"
        view.layer.addSublayer(shape)
    }
    
    func removeCircle(){
        view.layer.sublayers?.first(where: { $0.name == "shape"})?.removeFromSuperlayer()
    }
    

    @IBAction func ConnectButton(_ sender: Any) {
        if ConnectButton.titleLabel?.text == "Start" {
            ConnectButton.setTitle("Stop", for: .normal)
            StatusLogFields.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            drawTrack()
            removeCircle()
            
            self.StatusLogFields.text = self.StatusLogFields.text + "---------------------------" + "\n"
           
             self.getResponse()
             timer = Timer.scheduledTimer(timeInterval: settings.timeInterval(), target: self, selector: #selector(self.getResponse), userInfo: nil, repeats: true)
            
        } else if ConnectButton.titleLabel?.text == "Stop" {
           self.stop()
           removeTrack()
           removeCircle()
        }
    }
    
    
    @objc func getResponse() {
       removeCircle()
       drawCircle()
        self.networkService.request { (_, response, error) in
            
            if let response = response {
                let httpResponse = response as! HTTPURLResponse
                let responseDescription = self.responseCodes.getCodeDescription(code: httpResponse.statusCode)
                let currentTime = self.getCurrentTime()
                self.StatusLogFields.text = self.StatusLogFields.text + currentTime + "  " + "Status: " + String(httpResponse.statusCode) + " - " + responseDescription + "\n"
                self.scrollLog()

            }
            if let error = error {
               self.stop()
               self.errorAlert(errorDescription: error.localizedDescription)
               self.StatusLogFields.text = error.localizedDescription + "\n"
            }
        }
    }
    
    
    func stop(){
        timer?.invalidate()
        ConnectButton.setTitle("Start", for: .normal)
        StatusLogFields.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    
    func getCurrentTime() -> String{

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        return dateFormatter.string(from: date)
    }
    
    
    func scrollLog(){
        DispatchQueue.main.async {
            let range = NSMakeRange(self.StatusLogFields.text.count - 1, 0)
            self.StatusLogFields.scrollRangeToVisible(range)
        }
    }
    
    
    
    func errorAlert(errorDescription: String){
        let alert = UIAlertController(title: "Error", message: "Connection is failed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil ))
        self.present(alert, animated: true, completion: nil)
    }
    


}


//
//  ViewController.swift
//  MatsuHotPot
//
//  Created by 陳奕翰 on 2023/3/31.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        let phone = self.phoneNumber.text
        func isPhoneNo(_ phoneNumber : String) -> Bool{
            let phoneRegex = "^09\\d{8}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)//？？？？？？？？？？？？？
            return phoneTest.evaluate(with: phoneNumber)
        }
        
        let password = self.Password.text
        func isCorrectPassword(_ passWord : String) -> Bool{
            let passwordRegex = "^\\d{6}$"
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            return passwordTest.evaluate(with: passWord)
        }
        
        if isPhoneNo(phone!) == true && isCorrectPassword(password!){
        }else{
            if let soundURL = Bundle.main.url(forResource: "incorrect", withExtension: "mp3"){
                var soundID: SystemSoundID = 0
                AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
                AudioServicesPlayAlertSound(soundID)
            }
            let alert = UIAlertController(title: "登入失敗", message: "電話號碼或密碼錯誤", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確定", style: .default, handler: nil)
            okAction.setValue(UIColor.red, forKey: "titleTextColor")
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
     
    @IBAction func register(_ sender: UIButton) {
        
    }
}


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
    }


    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBAction func forgetPassword(_ sender: UIButton) {
        
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        let phone = self.phoneNumber.text
        let password = self.Password.text
        
    
        if phone == "12345678" && password == "111"{
            
        }else{
            let alert = UIAlertController(title: "登入失敗", message: "帳號或密碼錯誤", preferredStyle: .alert)
            alert.addAction(
                UIAlertAction(
                    title: "確定",
                    style: .default,
                    handler:
                        {
                          (a)->Void in
                            guard let soundURL = Bundle.main.url(forResource: "test", withExtension: "mp3") else {
                                    print("Could not find sound file.")
                                    return
                                }
                                do {
                                    let player = try AVAudioPlayer(contentsOf: soundURL)
                                    player.prepareToPlay()
                                    player.play()
                                } catch {
                                    print("Could not play sound: \(error.localizedDescription)")
                                }
                        }
                )
            )
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func register(_ sender: UIButton) {
    }
    
    
}


//
//  RockViewController.swift
//  My profile
//
//  Created by 박재용 on 2022/12/26.
//

import UIKit
import AVFoundation

class LockViewController: UIViewController {

    @IBOutlet weak var btn1 : UIButton!
    @IBOutlet weak var btn2 : UIButton!
    @IBOutlet weak var btn3 : UIButton!
    @IBOutlet weak var btn4 : UIButton!
    @IBOutlet weak var btn5 : UIButton!
    @IBOutlet weak var btn6 : UIButton!
    @IBOutlet weak var btn7 : UIButton!
    @IBOutlet weak var btn8 : UIButton!
    @IBOutlet weak var btn9 : UIButton!
    @IBOutlet weak var btn0 : UIButton!
    @IBOutlet weak var pass1 : UILabel!
    @IBOutlet weak var pass2 : UILabel!
    @IBOutlet weak var pass3 : UILabel!
    @IBOutlet weak var pass4 : UILabel!
    @IBOutlet weak var message : UILabel!
    
    var idx : Int = 0
    var pass = ["","","",""]
    let mypass = ["6","9","9","9"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        btn5.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
        btn7.layer.cornerRadius = 10
        btn8.layer.cornerRadius = 10
        btn9.layer.cornerRadius = 10
        btn0.layer.cornerRadius = 10

    }
    
    @IBAction func touchnum1(_ sender : UIButton){
        pass[idx] = "1"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    
    @IBAction func touchnum2(_ sender : UIButton){
        pass[idx] = "2"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum3(_ sender : UIButton){
        pass[idx] = "3"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum4(_ sender : UIButton){
        pass[idx] = "4"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum5(_ sender : UIButton){
        pass[idx] = "5"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum6(_ sender : UIButton){
        pass[idx] = "6"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum7(_ sender : UIButton){
        pass[idx] = "7"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum8(_ sender : UIButton){
        pass[idx] = "8"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum9(_ sender : UIButton){
        pass[idx] = "9"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    @IBAction func touchnum0(_ sender : UIButton){
        pass[idx] = "0"
        chagetext()
        idx += 1
        if(idx>=4){
            sol()
        }
    }
    
    @IBAction func touchback(_ sender : UIButton){
        if idx-1>=0{
            switch idx-1{
            case 0:pass1.text = "-"
            case 1:pass2.text = "-"
            case 2:pass3.text = "-"
            default: idx = 0
            }
            idx -= 1
        }
    }
    
    func chagetext(){
        
        switch idx{
        case 0:pass1.text = "*"
        case 1:pass2.text = "*"
        case 2:pass3.text = "*"
        case 3:pass4.text = "*"
        default: idx = 0
        }
    }
    
    func sol(){
        idx = 0
        var check = true
        for i in 0...3{
            if pass[i] != mypass[i]{
                check = false
            }
        }
       
        pass1.text = "-"
        pass2.text = "-"
        pass3.text = "-"
        pass4.text = "-"
        
        if check {
            dismiss(animated: true )
        }else{
            message.text = "다시 입력하세요!"
            UIDevice.vibrate()
        }
    }

}

extension UIDevice {

    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

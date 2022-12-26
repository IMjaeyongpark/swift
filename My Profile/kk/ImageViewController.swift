//
//  ImageViewController.swift
//  Intro
//
//  Created by 박재용 on 2022/12/25.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var bigimage : UIImageView!
    
    var dataReceived: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigimage.image = dataReceived
    }
    
    @IBAction func Touchbtn(_ sender : UIButton){
        dismiss(animated: true)
    }
}

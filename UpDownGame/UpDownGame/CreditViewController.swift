//
//  CreditViewController.swift
//  UpDownGame
//
//  Created by 박재용 on 2022/12/24.
//

import UIKit

class CreditViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    
    override func viewDidLoad() {
        imageView.image = #imageLiteral(resourceName: "IMG_7532")
    }

    @IBAction func touchUpdismissButton(){
        dismiss(animated: true )
    }
}

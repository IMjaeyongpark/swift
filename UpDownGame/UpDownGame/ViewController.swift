//
//  ViewController.swift
//  UpDownGame
//
//  Created by 박재용 on 2022/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue : Int = 0
    var tryCount : Int = 0
    
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var tryCountLabel : UILabel!
    @IBOutlet weak var sliderValueLabel : UILabel!
    @IBOutlet weak var MinValueLabel : UILabel!
    @IBOutlet weak var MaxValueLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        reset()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"),for: .normal)
    }

    @IBAction func sliderValueChanged(_ sender:UISlider){
        let intValue = Int(slider.value)
        sliderValueLabel.text = "\(intValue)"
    }
    
    @IBAction func touchUpHitButton(_ sender:UIButton){
        let hitValue = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount += 1
        if(tryCount>=5){
            print("YOU LOSE")
            reset()
            return
        }
        
        tryCountLabel.text = "\(tryCount) / 5"
        
        
        
        if randomValue == hitValue {
            print("YOU HIT")
            reset()
        }else if randomValue < hitValue{
            MaxValueLabel.text = "\(hitValue)"
            slider.maximumValue = Float(hitValue)
        }
        else{
            MinValueLabel.text = "\(hitValue)"
            slider.minimumValue = Float(hitValue)
        }
        
    }

    @IBAction func touchUpResetButton(_ sender:UIButton){
        reset()
    }
    
    func reset(){
        randomValue = Int.random(in: 0...30)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        MinValueLabel.text = "0"
        MaxValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}


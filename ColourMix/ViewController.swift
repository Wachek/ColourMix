//
//  ViewController.swift
//  ColourMix
//
//  Created by Вячеслав Турчак on 12.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabelValue: UILabel!
    @IBOutlet var greenLabelValue: UILabel!
    @IBOutlet var blueLabelValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        
        redLabelValue.text = String(redSlider.value)
        greenLabelValue.text = String(greenSlider.value)
        blueLabelValue.text = String(blueSlider.value)
    }

    func updateColour() {
        mainView.backgroundColor = UIColor.init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        redLabelValue.text = String(round(redSlider.value * 100) / 100)
        greenLabelValue.text = String(round(greenSlider.value * 100) / 100)
        blueLabelValue.text = String(round(blueSlider.value * 100) / 100)
    }
    
    @IBAction func redSliderAction() {
        updateColour()
    }
    
    @IBAction func greenSliderAction() {
        updateColour()
    }
    
    @IBAction func blueSliderAction() {
        updateColour()
    }
}


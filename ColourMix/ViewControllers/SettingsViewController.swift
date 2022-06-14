//
//  ViewController.swift
//  ColourMix
//
//  Created by Вячеслав Турчак on 12.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redLabelValue: UILabel!
    @IBOutlet var greenLabelValue: UILabel!
    @IBOutlet var blueLabelValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var updatedBackgroundColour = UIColor.blue
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        
        mainView.backgroundColor = updatedBackgroundColour
        
        red = updatedBackgroundColour.cgColor.components![0]
        green = updatedBackgroundColour.cgColor.components![1]
        blue = updatedBackgroundColour.cgColor.components![2]
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redLabelValue.text = String(redSlider.value)
        greenLabelValue.text = String(greenSlider.value)
        blueLabelValue.text = String(blueSlider.value)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
    
    }

    func updateColour() {
        mainView.backgroundColor = UIColor.init(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        redLabelValue.text = String(round(redSlider.value * 100) / 100)
        greenLabelValue.text = String(round(greenSlider.value * 100) / 100)
        blueLabelValue.text = String(round(blueSlider.value * 100) / 100)
        
        redTextField.text = String(round(redSlider.value * 100) / 100)
        greenTextField.text = String(round(greenSlider.value * 100) / 100)
        blueTextField.text = String(round(blueSlider.value * 100) / 100)
        
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
    
    @IBAction func doneButtonPressed() {
        updatedBackgroundColour = mainView.backgroundColor!
        delegate.setNewColour(with: updatedBackgroundColour)
        dismiss(animated: true)
    }
    
}


extension SettingsViewController: UITextFieldDelegate {
    
    
    
}

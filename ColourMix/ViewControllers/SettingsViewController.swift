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
    
    var red: Float = 0
    var green: Float = 0
    var blue: Float = 0
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 10
        
        mainView.backgroundColor = updatedBackgroundColour
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        red = Float(updatedBackgroundColour.cgColor.components![0])
        green = Float(updatedBackgroundColour.cgColor.components![1])
        blue = Float(updatedBackgroundColour.cgColor.components![2])
        
        redSlider.value = red
        greenSlider.value = green
        blueSlider.value = blue
        
        redLabelValue.text = String(format: "%.2f", red)
        greenLabelValue.text = String(format: "%.2f", green)
        blueLabelValue.text = String(format: "%.2f", blue)
        
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
    
    }

    func updateColour() {
        red = redSlider.value
        green = greenSlider.value
        blue = blueSlider.value
        
        mainView.backgroundColor = UIColor.init(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        
        redLabelValue.text = String(format: "%.2f", red)
        greenLabelValue.text = String(format: "%.2f", green)
        blueLabelValue.text = String(format: "%.2f", blue)
        
        redTextField.text = String(format: "%.2f", red)
        greenTextField.text = String(format: "%.2f", green)
        blueTextField.text = String(format: "%.2f", blue)
        
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
        view.endEditing(true)
        updatedBackgroundColour = mainView.backgroundColor!
        delegate.setNewColour(with: updatedBackgroundColour)
        dismiss(animated: true)
    }
    
}


extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        if textField == redTextField {
            red = numberValue
            redSlider.value = red
        } else if textField == greenTextField {
            green = numberValue
            greenSlider.value = green
        } else {
            blue = numberValue
            blueSlider.value = blue
        }
        
        updateColour()
    }
    
    
}

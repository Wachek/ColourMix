//
//  ResultViewController.swift
//  ColourMix
//
//  Created by Вячеслав Турчак on 12.06.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColour(with colour: UIColor)
}

class ResultViewController: UIViewController {

    var backgroundColour = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        backgroundColour = view.backgroundColor!
        guard let settingsVC = segue.destination as? SettingsViewController else {return}
        settingsVC.updatedBackgroundColour = backgroundColour
        settingsVC.delegate = self
    }

}

extension ResultViewController: SettingsViewControllerDelegate {
    func setNewColour(with colour: UIColor) {
        view.backgroundColor = colour
    }
}

//
//  KeyBoardViewController.swift
//  Template
//
//  Created by Максим Япринцев on 04.03.2023.
//

import UIKit

class KeyBoardViewController: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var textCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCode.attributedPlaceholder = NSAttributedString(string: "Введите штрих-код")
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    func setupButton() {
        confirmButton.backgroundColor = Colors.buttonColor
        confirmButton.tintColor = Colors.titleButtonColor
        confirmButton.titleLabel?.font = Fonts.buttonFont
        confirmButton.layer.cornerRadius = 12.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        textCode.resignFirstResponder()
    }

    @IBAction func tapOnActionButton(_ sender: Any) {
        view.endEditing(true)
        textCode.resignFirstResponder()
        let barcode = textCode.text ?? ""
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

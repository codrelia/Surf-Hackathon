//
//  KeyBoardViewController.swift
//  Template
//
//  Created by Максим Япринцев on 04.03.2023.
//

import UIKit

class KeyBoardViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var textCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCode.delegate = self
        confirmButton.setTitle("Узнать информацию", for: .normal)
        textCode.attributedPlaceholder = NSAttributedString(string: "Введите штрих-код")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textAction(_ sender: Any) {
        textCode.becomeFirstResponder()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("test")
        view.endEditing(true)
        textCode.resignFirstResponder()
    }
    @IBAction func buttonAction(_ sender: Any){
        view.endEditing(true)
        textCode.resignFirstResponder()
    }
    
}
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



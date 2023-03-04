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
        confirmButton.setTitle("Узнать информацию", for: .normal)
        textCode.attributedPlaceholder = NSAttributedString(string: "Введите штрих-код")
        // Do any additional setup after loading the view.
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

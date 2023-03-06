//
//  KeyBoardViewController.swift
//  Template
//
//  Created by Максим Япринцев on 04.03.2023.
//

import UIKit

class KeyBoardViewController: UIViewController {
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var textCode: UITextField!
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    private var errorMessage: ErrorMessage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textCode.attributedPlaceholder = NSAttributedString(string: "Введите штрих-код")
        setupButton()
        indicatorView.isHidden = true
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
        indicatorView.isHidden = false
        indicatorView.startAnimating()
        let model = ModelDetail()
        
        let vc = DetailViewController()
        
        model.takeRequest(header: barcode) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let info):
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    vc.setModel(info)
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.indicatorView.stopAnimating()
                    self.indicatorView.isHidden = true
                }
            case .failure(_):
                DispatchQueue.main.async {
                    self.errorMessage?.removeFromSuperview()
                    self.errorMessage = ErrorMessage(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 8.0))
                    self.errorMessage!.text = "Проблема с соединением! Попробуйте позже."
                    self.view.addSubview(self.errorMessage!)
                    self.errorMessage?.startAnimation()
                    self.indicatorView.stopAnimating()
                    self.indicatorView.isHidden = true
                }
            }
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

}

private extension KeyBoardViewController {
    func textCheck() {
        
        if (textCode.text == "") {
            let okButton = UIAlertAction(title: "Ok", style: .default)
            let alert = UIAlertController(title: "Ошибка", message: "Поле не должно быть пустым", preferredStyle: .alert)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
        for i in textCode.text! {
            if (textCode.text != "1") && (textCode.text != "2") && (textCode.text != "3") && (textCode.text != "4") && (textCode.text != "5") && (textCode.text != "6") && (textCode.text != "7") && (textCode.text != "8") && (textCode.text != "9") && (textCode.text != "0") {
                let okButton = UIAlertAction(title: "Ok", style: .default)
                let alert = UIAlertController(title: "Ошибка", message: "Поле должно содержать только цифры", preferredStyle: .alert)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }
        }
    }
}

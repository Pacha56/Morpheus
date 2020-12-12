//
//  ViewController.swift
//  Morpheus
//
//  Created by Luis Resende on 10/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private let sessionProvider = URLSessionProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = "user@morpheustest.com"
        passwordTextField.text = "Password1"
        
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setupView()
    {
        errorView.isHidden = true
        
        let color = UIColor(red: 44 / 255, green: 7 / 255, blue: 151 / 255, alpha: 1)
        
        usernameTextField.placeholder = "E.g. Gary123"
        
        passwordTextField.placeholder = "Password"
        
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.applyGradient(colors: [color.cgColor, color.withAlphaComponent(0.7).cgColor])
        
        let attributedText = NSMutableAttributedString().normal("Don't have an account? ", 15, color).boldUnderline("Register", 15, color)
        registerButton.setAttributedTitle(attributedText, for: .normal)
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let username = usernameTextField.text, !username.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            
            self.errorLabel.text = "Provide username and password"
            self.errorView.isHidden = false
            
            return
        }
        
        ServiceManager.shared.login(username: username, password: password) { result, error  in
            
            if let tokens = result
            {
                let defaults = UserDefaults.standard
                defaults.setValue(tokens.authToken, forKey: "authToken")
                defaults.setValue(tokens.refreshToken, forKey: "refreshToken")
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "profilesSegue", sender: nil)
                }
            }
            else
            {
                DispatchQueue.main.async {
                    self.errorLabel.text = error ?? "An error occurred"
                    self.errorView.isHidden = false
                }
            }
        }
    }
}

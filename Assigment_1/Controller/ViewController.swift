//
//  ViewController.swift
//  Assignment_1
//
//  Created by Purv Sinojiya on 25/02/25.
//

import UIKit

// Define User Model


// Define API Response Model


class ViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true // Hide error label initially
    }

    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        validateLogin()
    }
    
    private func validateLogin() {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showError("Email and Password cannot be empty")
            return
        }
        
        // Email format validation
        if !isValidEmail(email) {
            showError("Invalid email format")
            return
        }
        
        // Password length validation
        if password.count < 6 {
            showError("Password must be at least 6 characters")
            return
        }
        
        errorLabel.isHidden = true
        print("Login Successful for: \(email)")

        // Create UserModel instance with dynamic email & password
        let user = UserModel(
            userName: email,
            password: password,
            softwareType: "AN",  // Static Value
            releaseVersion: "049" // Static Value
        )
        
        Task {
             fetchData(user: user) { result in
                switch result {
                case .success(let responseData):
                    print("API Success: \(responseData)")
                    // ✅ Navigate to the next screen on success
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let signupVC = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController {
                            signupVC.firstName=responseData.firstName
                            signupVC.lastName=responseData.lastName
                            signupVC.dob=responseData.dob
                            signupVC.gender = responseData.gender == 1 ? "Male" : "Female"
                            signupVC.height = Double(responseData.heightCM ?? 0)
                            self.navigationController?.pushViewController(signupVC, animated: true)
                        }
                    }
                    
                case .failure(let error):
                    print("API Failure: \(error.localizedDescription)")
                    // ✅ Show an error alert
                    DispatchQueue.main.async {
                        self.showError("Failed to fetch data: \(error.localizedDescription)")
                    }
                }
            }
        }

    }
    
    private func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

     }

//
//  LoginViewController.swift
//  The-Movie-Manager
//
//  Created by Jathurchan Selvakumar on 15/04/2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        TMDBClient.getRequestToken(completion: handleRequestTokenResponse(success:error:))
    }
    @IBAction func loginWithWebsite(_ sender: Any) {
        TMDBClient.getRequestToken { (success, error) in
            if success {
                DispatchQueue.main.async {
                    UIApplication.shared.open(TMDBClient.Endpoints.webAuth.url, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
    func handleRequestTokenResponse(success: Bool, error: Error?) {
        DispatchQueue.main.async {
            print(self.emailTextField.text!)
            print(self.passwordTextField.text!)
        }
        if success {
            print(TMDBClient.Auth.requestToken)
            DispatchQueue.main.async {
                TMDBClient.login(username: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: self.handleLoginResponse(success:error:))
            }
        }
    }
    
    func handleLoginResponse(success: Bool, error: Error?) {
        if success{
            print(TMDBClient.Auth.requestToken)
            TMDBClient.createSessionId(completion: handleSessionResponse(success:error:))
        }
    }
    
    func handleSessionResponse(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.sessionId)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }
        }
    }
    
}

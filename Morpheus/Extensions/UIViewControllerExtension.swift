//
//  UIViewControllerExtension.swift
//  HorseRacing
//
//  Created by Luis Resende on 06/12/2020.
//

import UIKit

extension UIViewController
{
    func showAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))

        present(alert, animated: true)
    }
    
    func showLogin(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "loginVC") as? UINavigationController else { return }
        
        UIApplication.shared.windows.first?.rootViewController = vc
    }
    
    func showProfiles(){
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "profilesVC") as? UINavigationController else { return }
        
        UIApplication.shared.windows.first?.rootViewController = vc
    }
}

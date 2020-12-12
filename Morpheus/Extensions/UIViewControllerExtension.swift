//
//  UIViewControllerExtension.swift
//  HorseRacing
//
//  Created by Luis Resende on 06/12/2020.
//

import UIKit
import SafariServices

extension UIViewController
{
    func openUrlOnSafari(url: String)
    {
        if let url = URL(string: url) {
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
    }
    
    func showAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))

        present(alert, animated: true)
    }
}

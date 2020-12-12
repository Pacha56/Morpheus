//
//  InitialViewController.swift
//  Morpheus
//
//  Created by Luis Resende on 12/12/2020.
//

import UIKit

class InitialViewController : UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if UserDefaults.standard.string(forKey: "authToken") == nil
        {
            showLogin()
        }
        else
        {
            showProfiles()
        }
    }
}

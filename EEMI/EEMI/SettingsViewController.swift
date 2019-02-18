//
//  SettingsViewController.swift
//  EEMI
//
//  Created by Jorge Elizondo on 2/17/19.
//  Copyright © 2019 Io Labs. All rights reserved.
//

import UIKit
import KeychainAccess

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logout(_ sender: UIButton) {
        let keychain = Keychain(service: "emmiapi.azurewebsites.net")
        keychain["user"] = nil
        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        view.window!.rootViewController = viewController
    }
}

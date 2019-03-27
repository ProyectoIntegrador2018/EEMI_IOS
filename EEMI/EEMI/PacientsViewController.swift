//
//  PacientsViewController.swift
//  EEMI
//
//  Created by Jorge Elizondo on 2/17/19.
//  Copyright © 2019 Io Labs. All rights reserved.
//

import UIKit

class PacientsViewController: UIViewController {

    var pinCodeView: PinCodeView!
    var pin = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: - Local Authorization

extension PacientsViewController: PinCodeDelegate {
    func didSelectButton(number: Int) {
        pin.append(Character(String(number)))
        if String(pin) == User.shared.pin {
            pinCodeView.removeFromSuperview()
        }
    }
    
    func didSelectDelete() {
        _ = pin.popLast()
    }
}

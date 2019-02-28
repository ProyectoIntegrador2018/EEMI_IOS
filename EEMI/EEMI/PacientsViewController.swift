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

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification ,
                                               object: nil)
    }

    @objc func appWillEnterForeground() {

    }

}

// MARK: - Local Authorization

extension PacientsViewController: PinCodeDelegate {
    func didSelectButton(number: Int) {

    }

    func didSelectDelete() {

    }
}

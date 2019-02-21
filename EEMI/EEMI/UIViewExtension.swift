//
//  UIViewExtension.swift
//  Reports
//
//  Created by Jorge Elizondo on 11/16/18.
//  Copyright © 2018 jorge. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.1, height: 0.1)
        layer.shadowOpacity = 0.2
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    func loadFromNib() {
        loadFromNib(named: String(describing: type(of: self)))
    }
    
    func loadFromNib(named name: String) {
        let bundle = Bundle(for: type(of: self))
        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            fatalError("Nib not found.")
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        layoutAttachViewToSuperview(view: view)
    }
    
    func layoutAttachViewToSuperview(view: UIView) {
        let views = ["view": view]
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                                   options: [],
                                                                   metrics: nil,
                                                                   views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                                 options: [],
                                                                 metrics: nil,
                                                                 views: views)
        addConstraints(horizontalConstraints + verticalConstraints)
    }
    
}
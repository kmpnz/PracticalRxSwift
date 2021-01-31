//
//  UISetupableType.swift
//  GetReactive
//
//  Created by Andreas Kompanez on 21.01.21.
//

import UIKit

protocol UISetupableType {
    func setupUI()
}

extension UISetupableType where Self: UIViewController {
    /** Adds the default implementation. */
    func setupUI() {}
}

//
//  ExtensionViewCell.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

extension UITableViewCell {
    func setShadow(view: UIView){
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowOpacity = 0.6
    }
}

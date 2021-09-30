//
//  UIView+Ext.swift
//  Big Bite
//
//  Created by Andrey Alymov on 14.09.2021.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}

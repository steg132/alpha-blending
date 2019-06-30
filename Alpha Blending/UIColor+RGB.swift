//
//  UIColor+RGB.swift
//  Alpha Blending
//
//  Created by Ryan Schumacher on 6/29/19.
//  Copyright © 2019 Ryan Schumacher. All rights reserved.
//

import SwiftUI

extension UIColor {

    var rgb: (red: Double, green: Double, blue: Double) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0

        self.getRed(&red, green: &green, blue: &blue, alpha: nil)

        return (Double(red), Double(green), Double(blue))
    }
}

//
//  UIColorExtensions.swift
//  Compliment Me
//
//  Created by Nicholas Wilding on 08/03/2015.
//  Copyright (c) 2015 Nicholas Wilding. All rights reserved.
//

import UIKit
import Foundation

// MARK: - UIColor Extension

extension UIColor {
    
    /// convert hex to UIColor
    convenience init(hex: String) {
        
        let _ = hex.replacingOccurrences(of: "#", with: "")
        
        
        var rgbValue:UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        
        self.init (
            red: CGFloat((rgbValue >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgbValue >> 8) & 0xFF) / 255.0,
            blue: CGFloat((rgbValue) & 0xFF) / 255.0,
            alpha: 1.0
        )
    }
    
    func ios7Red() -> UIColor {
        return UIColor(red: 0.1, green: 0.3, blue: 0.3, alpha: 1)
    }
    
    
    func withAlpha(_ alpha: Float) -> UIColor {

        let components = self.cgColor.components
        let red = Float((components?[0])!)
        let green = Float((components?[1])!)
        let blue = Float((components?[2])!)
        let color = UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
        
        return color
    }
    
}





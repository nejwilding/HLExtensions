//
//  NibLoadableView.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 21/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

/// NibLoadableView
protocol NibLoadableView: class { }

/// Extend NibLoadableView for class UIView
extension NibLoadableView where Self: UIView {
    
    /// Nib file class as String
    static var nibName: String {
        return String(Self)
    }
}
//
//  ReusableView.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 21/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

/// Reusable View
protocol ReusableView: class { }

/// Extend Reusable View for UIView
extension ReusableView where Self: UIView {
    
    /// convert UIView class name to string type
    static var reuseIdentifier: String {
    	return String(self)
    }
}

/// Extend UITableView to conform to ReusableView
extension UITableViewCell: ReusableView { }

/// Extend UITableViewHeaderFooterView to conform to ReusableView
extension UITableViewHeaderFooterView: ReusableView { }

/// Extend UICollectionView to conform to ReusableView
extension UICollectionViewCell: ReusableView { }
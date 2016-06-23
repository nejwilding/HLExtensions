//
//  UITableView+Extension.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 21/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

// MARK: - UITableView Nib Extension

extension UITableView {
    
    /// Extend UITableView to register Nib for UITableViewCell
    func registerNibCell<T: UITableViewCell where T: ReusableView, T: NibLoadableView>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Extend UITableView to register Nib for UITableViewHeaderFooterView
    func registerNibHeaderFooterView<T: UITableViewHeaderFooterView where T: ReusableView, T: NibLoadableView>(_: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

// MARK: - UITableView Cell Extension

extension UITableView {
    
    /// Extend UITableView to dequeue cell
    func dequeueReusableCell<T: UITableViewCell where T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {

        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
    	return cell
    }
}


extension UITableView {
    
    
}

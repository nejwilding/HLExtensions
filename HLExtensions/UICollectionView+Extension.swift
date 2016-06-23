//
//  UICollectionView+Extension.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 21/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation


// MARK: - UICollectionView Cell Extension

extension UICollectionView {
    
    /// Extend UICollectionView to dequeue cell
    func dequeueReusableCell<T: UICollectionViewCell where T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(T.reuseIdentifier)")
        }
        return cell
    }
}

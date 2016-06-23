//
//  StoryboardIdentifiable.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 17/05/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

// MARK: - Protocol Storyboard Identifiable

/// Storyboard Identifiable - class type protocol
public protocol StoryboardIdentifiable: class {
    
    /// get a string storyboardIdentifier
    static var storyboardIdentifier: String { get }
}

/// Extend Storyboard Identifiable for UIViewController
extension StoryboardIdentifiable where Self: UIViewController {
    
    /**
 	Default storyboardIdentifier implmentation
    
 	- Returns: String of class self
 	*/
    public static var storyboardIdentifier: String {
        return String(self)
    }
}

/// Extend UIViewController
/// Conform Storyboard identifiable to all UIViewControllers
extension UIViewController: StoryboardIdentifiable { }


// MARK: - Protocol Storyboard

public protocol Storyboard: RawRepresentable {
    
    /// get a string storyboardName
    var storyboardName: String { get }
}

// MARK: - Extend UIStoryboard

extension UIStoryboard {
    
    /**
     Extend UIStoryboard with convenience init for Storyboard
     and instantiate UIStoryboard
 
     - Parameter storyboard: Storyboard type
     - Paramater bundle:     Bundle, defaults to nil
 
     - Returns: UIStoryboard instance
    */
    class func storyboard<T: Storyboard>(_ storyboard: T, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.storyboardName, bundle: bundle)
    }
    
    /**
 	Extend UIStoryboard to instantiate view controller on storyboard
     View contoller is found by identifier based on class type name
     
     - Type must conform to StoryboardIdentifiable
     
     - Returns: View controller of type T
 	*/
    func instantiateViewController<T: UIViewController where T: StoryboardIdentifiable>() -> T {
        let optionalViewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        
        guard let viewController = optionalViewController as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        
        return viewController
    }
    
}

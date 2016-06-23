//
//  SegueHandlerType.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 04/05/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

public protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    public func segueIdentiferForSegue(_ segue: UIStoryboardSegue) -> SegueIdentifier {
        
        guard let identifier = segue.identifier,
            let segueIdentifier = SegueIdentifier(rawValue: identifier)
            else { fatalError("Unknown segue \(segue)") }
        
        return segueIdentifier
    }
    
    public func performSegue(_ segueIdentifier: SegueIdentifier) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: nil)
    }
}

//
//  Array+Extension.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 08/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func shuffle() {
        
        for i in 0 ..< (count - 1) {
            let randomNumber = Int(arc4random_uniform(UInt32(count - i)))
            let randomIndex = Int(randomNumber)
            swap(&self[i], &self[randomIndex])
        }
    }

}

extension Array where Element: protocol<Equatable, Hashable> {
    
    public func uniq() -> [Element] {
        var seen = Set<Element>(minimumCapacity: count)
        return self.filter { x in
            let unseen = !seen.contains(x)
            seen.insert(x)
            return unseen
        }
    }
}

extension Array where Element: Equatable {
    
    // Remove first collection element that is equal to the given `object`:
    mutating func removeObject(_ object: Element) {
        if let index = index(of: object) {
            remove(at: index)
        }
    }
}

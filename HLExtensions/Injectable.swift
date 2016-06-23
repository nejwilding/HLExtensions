//
//  Injectable.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 10/06/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation

public protocol Injectable {
    associatedtype T
    func inject(_: T)
    func assertDependencies()
}

//extension ReportingTermCollectionViewCell: Injectable {
//    typealias T = ReportingTermCellViewModel
//
//    func inject(object: T) {
//        reportingTermCellViewModel = object
//    }
//
//    func assertDependencies() {
//        assert(reportingTermCellViewModel != nil)
//    }
//}

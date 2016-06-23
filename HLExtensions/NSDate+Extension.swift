//
//  NSDate+Extension.swift
//  PE Passport
//
//  Created by Nicholas Wilding on 16/05/2016.
//  Copyright © 2016 Nicholas Wilding. All rights reserved.
//

import Foundation


extension Date {
    
    func startOfMonth() ->  Date? {
        let calendar = Calendar.current()
        let currentDateComponents = calendar.components([Calendar.Unit.month, Calendar.Unit.year], from: self)
        let startOfMonth = calendar.date(from: currentDateComponents)
        return startOfMonth
    }
    
    func endOfMonth() -> Date? {
        let calendar = Calendar.current()
        
        if let nextMonth = calendar.date(byAdding: .month, value: 1, to: self, options: Calendar.Options(rawValue: 0)) {
            let nextDateComponents = calendar.components([Calendar.Unit.month, Calendar.Unit.year], from: nextMonth)
            let endOfMonth = calendar.date(from: nextDateComponents)?.addingTimeInterval(-1)
            
            return endOfMonth
        }
        
        return nil
        
    }
    
    
    func endOfDay() -> Date? {
        let calendar = Calendar.current()
        
        if let nextDay = calendar.date(byAdding: .day, value: 1, to: self, options: Calendar.Options(rawValue: 0)) {
            let nextDateComponents = calendar.components([.month, .year, .day], from: nextDay)
            let endOfDay = calendar.date(from: nextDateComponents)?.addingTimeInterval(-1)
            
            return endOfDay
        }
        
        return nil
        
    }
    
    
    func plusOneHour() -> Date? {
        let calendar = Calendar.current()
        
        let date = calendar.date(
            byAdding: .hour,
            value: 1,
            to: self,
            options: Calendar.Options(rawValue: 0) )
        
        return date
        
    }
    
    
    func withMidnightTime() -> Date? {
        let calendar = Calendar.current()
        let currentDateComponents = calendar.components([.year, .month, .day], from: self)
        let dateAtMidnight = calendar.date(from: currentDateComponents)
        
        return dateAtMidnight
        
    }
    
    func withCurrentTime() -> Date? {
        let calendar = Calendar.current()
        let dateNow = Date()
        let currentDateComponents = calendar.components([.hour, .minute], from: dateNow)
        let updatedDate = calendar.date(bySettingHour: currentDateComponents.hour!, minute: currentDateComponents.minute!, second: 0, of: self, options: Calendar.Options(rawValue:0))
        return updatedDate
        
    }
    
    
    func isMidnight() -> Bool {
        let calendar = Calendar.current()
        let currentDateComponents = calendar.components([.hour, .minute], from: self)
        
        if currentDateComponents.hour == 0 && currentDateComponents.minute == 0 {
            return true
        } else {
            return false
        }
        
    }
    
    func hadMonthChanged(_ originalDate: Date) -> Bool {
        let calendar = Calendar.current()
        let currentDateOriginal = calendar.components([.month], from: originalDate)
        let currentDateComponents = calendar.components([.month], from: self)
        
        return currentDateOriginal.month != currentDateComponents.month ? true : false
    }
    
    func dayValue() -> Int {
        let calendar = Calendar.current()
        let currentDateComponents = calendar.components([.day], from: self)
        return currentDateComponents.day!
    }
    
    func monthValue() -> Int {
        let calendar = Calendar.current()
        let currentDateComponents = calendar.components([.month], from: self)
        return currentDateComponents.month!
    } 
}

//
//  File.swift
//  
//
//  Created by Crisler Chee on 2019/10/09.
//

import Foundation

// Gets the differenct elements between 2 arrays
extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

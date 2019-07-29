//
//  SampleData.swift
//  SwiftyUI
//
//  Created by Arsha Hassas on 7/29/19.
//

import Foundation
import SwiftUI

#if DEBUG

extension String: Identifiable {
    public var id: Int {
        return self.hashValue
    }
}


let sampleStrings = [
    "Hello", "Goodbye", "What?!"
]

#endif


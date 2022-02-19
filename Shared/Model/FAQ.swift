//
//  FAQ.swift
//  SwiftUICombineData (iOS)
//
//  Created by Harry on 19/02/2022.
//

import Foundation

struct FAQ: Identifiable, Decodable {
    var id: Int
    var question: String
    var answer: String
}

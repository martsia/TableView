//
//  Data.swift
//  tableJSONParsing
//
//  Created by Marta Kalichynska on 14.02.2022.
//

import UIKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

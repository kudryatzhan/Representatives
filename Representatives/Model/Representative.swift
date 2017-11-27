//
//  Representative.swift
//  Representatives
//
//  Created by Kudryatzhan Arziyev on 11/27/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import Foundation

struct Representative: Codable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
}

struct Congress: Codable {
    
    let results: [Representative]
}

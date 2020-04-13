//
//  Episode.swift
//  IramTableViewSections
//
//  Created by C4Q on 4/13/20.
//  Copyright © 2020 Iram Fattah. All rights reserved.
//

import Foundation

struct Episode: Codable, Hashable {
    let name: String
    let runtime: Int
    let summary: String
    let season: Int
    let number: Int
}


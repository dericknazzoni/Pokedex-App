//
//  Pokemon.swift
//  Pokedex-Api
//
//  Created by Derick Willians Plens Nazzoni on 23/07/19.
//  Copyright © 2019 Derick Willians Plens Nazzoni. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    
    var arrayPokemon: [String]?
    var entryNumber: Int?
    var url: String?
}

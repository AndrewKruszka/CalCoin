//
//  CoinsResponse.swift
//  CalCoin
//
//  Created by Jules Maslak on 4/6/24.
//

import Foundation

struct CoinsResponse: Decodable {
    var data: [String: [Coin]]
}

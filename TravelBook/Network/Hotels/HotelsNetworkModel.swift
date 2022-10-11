//
//  HotelsNetworkModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

struct HotelsNetworkModel: Decodable {
    var data: Data
}

struct Data: Decodable {
    var body: Body
}
struct Body: Decodable {
    var searchResults: SearchResults
}

struct SearchResults: Decodable {
    var results: [Results]
}

struct Results: Decodable {
    let name: String
    let id : Int
    let address: Address
    let ratePlan: RatePlan
}
struct Address: Decodable {
    let streetAddress: String
}
struct RatePlan: Decodable {
    let price: Price
}

struct Price: Decodable {
    let current: String
}

    

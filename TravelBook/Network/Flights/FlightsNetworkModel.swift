//
//  FlightsNetworkModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

// MARK: - Flights
struct FlightsNetworkModel: Decodable {
    let success: Bool?
    var data: [String: Datum]?
    let currency: String?
}

// MARK: - Datum
struct Datum: Decodable {
    let origin: String?
    let destination: String?
    let price: Int?
    let airline: String?
    let flight_number: Int?
    let departureAt, returnAt: Date?
    let transfers: Int?
    let expiresAt: Date?


}

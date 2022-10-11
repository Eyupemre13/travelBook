//
//  HotelsDetailNetworkModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation
struct HotelsDetailNetworkModel: Decodable {
  
    var data: DataClass
}

struct DataClass: Decodable {
    var body: Body2
}
struct Body2: Decodable {
    
    var propertyDescription : PropertyDescription
    var overview : Overview
}
struct PropertyDescription : Decodable {
    let name : String
    var address : DetailAddress
    var featuredPrice : FeaturedPrice
    
}
struct DetailAddress : Decodable {
    let fullAddress : String
}
struct FeaturedPrice : Decodable {
    var currentPrice : DetailCurrentPrice
}
struct DetailCurrentPrice : Decodable {
    var formatted : String
}

struct Overview : Decodable {
    var overviewSections : [OverviewSections]
}
struct OverviewSections : Decodable {
    var content : [String];
    
}






    





//
//  HotelsDetailViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

protocol HotelsDetailViewModelDelegate: AnyObject {
    func setData(hotelName:String,hotelDesc:String,hotelPrice:String)
}


class HotelsDetailViewModel {
    var hotelId : Int = 0
    
    
    weak var delegate: HotelsDetailViewModelDelegate?
    
    var detailNetworkManager = HotelsNetworkManager()
    
   
   func getData() {
        detailNetworkManager.getData(urlString: "https://hotels4.p.rapidapi.com/properties/get-details?id=\(hotelId)&checkIn=2022-12-10&checkOut=2022-12-15&adults1=2&currency=TRY&locale=tr_TR", completionHandler: { (result: HotelsDetailNetworkModel) in
            let hotelName = result.data.body.propertyDescription.name
            let hotelPrice = result.data.body.propertyDescription.featuredPrice.currentPrice.formatted
            let hotelDesc = result.data.body.propertyDescription.address.fullAddress
            self.delegate?.setData(hotelName: hotelName, hotelDesc:hotelDesc ,hotelPrice: hotelPrice)
        })
    }
 }




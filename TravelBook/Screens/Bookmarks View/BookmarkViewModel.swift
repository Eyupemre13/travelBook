//
//  BookmarkViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 8.10.2022.
//

import Foundation

class BookmarkViewModel {
    let coreDataManager = HotelCoreDataManager()
    var  items = [HotelDetailData]()
    var hotelId : Int = 0
    
    
    
    
    func getData() {
        items = coreDataManager.getData()
        print(items)
       
}


    }







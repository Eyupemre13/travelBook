//
//  SearchViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 9.10.2022.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func reloadTableView()
}

class SearchViewModel {
    weak var delegate: SearchViewModelDelegate?
    let coreDataManager = HotelCoreDataManager()
    
    var  items = [HotelDetailData]()
    var hotelId : Int = 0
    var isEmpty = false
    
    func getData(searchText:String) {
        isEmpty = false
        let itemsArray = coreDataManager.getData()
        items = itemsArray.filter { $0.hotelName.contains(searchText) }
        delegate?.reloadTableView()
        print(items)
        
        
    }
    func clearData() {
        isEmpty = true
        items = []
        delegate?.reloadTableView()
    }
    
}


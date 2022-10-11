//
//  HomeCollectionViewCellModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation

class Places {
    var place_id : Int?
    var place_image_name : String?
    var place_lbl : String?
    var place_desc_lbl : String?
    
    init(place_id: Int, place_image_name: String, place_lbl : String, place_desc_lbl : String ){
        
        
        self.place_id = place_id
        self.place_image_name = place_image_name
        self.place_lbl = place_lbl
        self.place_desc_lbl = place_desc_lbl
    }
}

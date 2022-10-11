//
//  FlightsViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation
protocol FlightsViewModelDelegate: AnyObject {
    func reloadData()
}

class FlightsViewModel {
    let networkManager = FlightsNetworkManager()

     var fligthsItemsArray: FlightsNetworkModel?
     
   
     weak var delegate: FlightsViewModelDelegate?

func flightsGetData() {
    networkManager.getData(urlString: "https://travelpayouts-travelpayouts-flight-data-v1.p.rapidapi.com/v1/prices/calendar?calendar_type=departure_date&destination=ESB&origin=SAW&depart_date=2022-11-01&currency=TRY", completionHandler: { (total: FlightsNetworkModel) in
        self.fligthsBindData(total: total)
        
    })
  }
    
private func fligthsBindData(total: FlightsNetworkModel) {
    guard (fligthsItemsArray != nil) else {
        fligthsItemsArray = total
        delegate?.reloadData()
        return
        
    }

    for element in total.data! {
        print("\(element.value.price!)---\(element.value.origin!)---\(element.value.destination!)")
        delegate?.reloadData()
    }
    

}
func fligthsGetArrayCount() -> Int {
    fligthsItemsArray?.data?.count ?? 0
    
    
    // getArrayCount -> numberOfRowsInSection
}
func flightsGetItemData(indexPath: IndexPath) -> FlightsTableViewCellModel? {
    if let flightsArray = fligthsItemsArray?.data {
        let values = Array(flightsArray.values)
        return FlightsTableViewCellModel(name: values[indexPath.row].origin ?? "", desc: "\(values[indexPath.row].flight_number ?? 0)", number: values[indexPath.row].destination ?? "")

    }
    return nil
}
}


//
//  HotelsViewModel.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import Foundation
protocol HotelsViewModelDelegate: AnyObject {
    func reloadData()
}
class HotelsViewModel {
    let hotelsNetworkManager = HotelsNetworkManager()
     var itemsArray: HotelsNetworkModel?

    
    
    
    weak var delegate: HotelsViewModelDelegate?
  
    

func getData() {
    hotelsNetworkManager.getData(urlString: "https://hotels4.p.rapidapi.com/properties/list?destinationId=1703365&pageNumber=1&pageSize=10&checkIn=2022-12-10&checkOut=2022-12-15&adults1=2&currency=TRY&locale=tr_TR", completionHandler: { (result: HotelsNetworkModel) in
        self.bindData(result: result)
        
})
}
private func bindData(result: HotelsNetworkModel) {
    guard (itemsArray != nil) else {
        itemsArray = result
        delegate?.reloadData()
        return
    }
    for element in result.data.body.searchResults.results {
        itemsArray?.data.body.searchResults.results.append(element)
     
    }
    delegate?.reloadData()
    
   

}
func getArrayCount() -> Int {
    return self.itemsArray?.data.body.searchResults.results.count ?? 0
    
}
func getItemData(indexPath: IndexPath) -> HotelsTableViewCellModel? {
    if let networkArray = itemsArray?.data.body.searchResults.results {
        return HotelsTableViewCellModel(name: networkArray[indexPath.row].name, address: networkArray[indexPath.row].address.streetAddress,desc: networkArray[indexPath.row].ratePlan.price.current)
    }
    return nil
}
}







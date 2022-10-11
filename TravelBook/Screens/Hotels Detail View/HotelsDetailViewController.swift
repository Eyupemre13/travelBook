//
//  HotelsDetailViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

class HotelsDetailViewController: UIViewController {
    
    lazy var viewModel : HotelsDetailViewModel? = HotelsDetailViewModel()
    let hotelCoreDataManager = HotelCoreDataManager()
    

    @IBOutlet weak var hotelsDetailView: UIView!
    @IBOutlet weak var hotelsDetailImage: UIImageView!
    @IBOutlet weak var hotelsDetailCategories: UILabel!
    @IBOutlet weak var hotelsDetailTitle: UILabel!
    @IBOutlet weak var hotelsDetailDesc: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getData()
        viewModel?.delegate = self
        
   }
    
    @IBAction func AddBtn(_ sender: Any) {
        hotelCoreDataManager.addData(data: HotelDetailData(hotelName: hotelsDetailTitle.text ?? "", hotelAddress: hotelsDetailDesc.text ?? "", hotelPrice: hotelsDetailCategories.text ?? "",hotelId: viewModel?.hotelId ?? 0 ))
     
    }
    
}
extension HotelsDetailViewController: HotelsDetailViewModelDelegate {
    func setData(hotelName: String, hotelDesc: String,hotelPrice: String) {
        DispatchQueue.main.async {
            self.hotelsDetailTitle.text = hotelName
            self.hotelsDetailDesc.text = hotelDesc
            self.hotelsDetailCategories.text =  hotelPrice
        
         
          
        }
 }
    }







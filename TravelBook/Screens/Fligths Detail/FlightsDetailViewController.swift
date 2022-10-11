//
//  FlightsDetailViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit


class FlightsDetailViewController: UIViewController {
    
  
    @IBOutlet weak var flightsTitle: UILabel!
    @IBOutlet weak var flightsDecs: UILabel!
    @IBOutlet weak var flightsNumber: UILabel!
    
    var transferTitle : String = ""
    var transferDesc : String = ""
    var transferItem : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flightsTitle.text = transferTitle
        flightsDecs.text = transferDesc
        flightsNumber.text = transferItem
        
  
       
}
    
    
}


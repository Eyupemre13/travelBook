//
//  SearchDetailViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 9.10.2022.
//

import UIKit

class SearchDetailViewController: UIViewController {

    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var searchDesc: UITextView!
    @IBOutlet weak var searchPrice: UILabel!
    
    var searchtitle : String = ""
    var searchdesc : String = ""
    var searchprice : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchTitle.text = searchtitle
        searchDesc.text = searchdesc
        searchPrice.text = searchprice

        
    }
}

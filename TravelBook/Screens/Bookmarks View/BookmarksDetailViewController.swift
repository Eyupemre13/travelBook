//
//  BookmarksDetailViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 8.10.2022.
//

import UIKit

class BookmarksDetailViewController: UIViewController {

    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDesc: UITextView!
    @IBOutlet weak var detailPrice: UILabel!
    var detailtitle : String = ""
    var detaildesc : String = ""
    var detailprice : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitle.text = detailtitle
        detailDesc.text = detaildesc
        detailPrice.text = detailprice
        
        

   
    }
    



}

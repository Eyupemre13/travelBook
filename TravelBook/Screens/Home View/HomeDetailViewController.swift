//
//  HomeDetailViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 9.10.2022.
//

import UIKit

class HomeDetailViewController: UIViewController {
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDesc: UITextView!
    
    var articleimage : String = ""
    var articletitle : String = ""
    var articledesc : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleImage.image = UIImage(named: articleimage)
        articleTitle.text = articletitle
        articleDesc.text = articledesc

     
    }
    
    



}

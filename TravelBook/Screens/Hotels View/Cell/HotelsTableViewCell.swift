//
//  HotelsTableViewCell.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

class HotelsTableViewCell: UITableViewCell {
    @IBOutlet weak var hotelsView: UIView!
    @IBOutlet weak var hotelsImage: UIImageView!
    @IBOutlet weak var hotelsName: UILabel!
    @IBOutlet weak var hotelsDesc: UILabel!
    @IBOutlet weak var hotelPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data: HotelsTableViewCellModel) {
        hotelsName.text = data.name
        hotelsDesc.text = data.address
        hotelPrice.text = data.desc 
    }
}










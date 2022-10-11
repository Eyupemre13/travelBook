//
//  OperationTableViewCell.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 11.10.2022.
//

import UIKit

class OperationTableViewCell: UITableViewCell {
    @IBOutlet weak var operationText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellConfigure(text:String) {
        operationText.text = text 
    }
    
}

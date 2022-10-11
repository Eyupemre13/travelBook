//
//  FlightsViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

protocol DetayVCToViewControllerDelegate: AnyObject {
    func veriGonder(mesaj:String)
    
}

class FlightsViewController: UIViewController {
    @IBOutlet weak var flightsTableView: UITableView!
    lazy var flightsviewModel : FlightsViewModel? = FlightsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCell()
        flightsviewModel?.delegate = self
        flightsviewModel?.flightsGetData()

    }
    func prepareCell() {
        
        flightsTableView.register(UINib(nibName: "FlightsTableViewCell", bundle: nil), forCellReuseIdentifier: "flightsCell")
        flightsTableView.delegate = self
        flightsTableView.dataSource = self
    }
}

extension FlightsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        flightsviewModel?.fligthsGetArrayCount() ?? 0
       
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = flightsTableView.dequeueReusableCell(withIdentifier: "flightsCell", for: indexPath) as? FlightsTableViewCell else { return UITableViewCell()}
        if let cellD = flightsviewModel?.flightsGetItemData(indexPath: indexPath) {
            cell.configure(data: FlightsTableViewCellModel(name: cellD.name, desc: cellD.desc,number: cellD.number))
            return cell
            
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC : FlightsDetailViewController = storyBoard.instantiateViewController(withIdentifier: "FlightsDetailViewController") as! FlightsDetailViewController
         
          if let flightsArray = flightsviewModel?.fligthsItemsArray?.data {
            let values = Array(flightsArray.values)
              destinationVC.transferTitle = values[indexPath.row].origin ?? ""
              destinationVC.transferDesc = values[indexPath.row].destination ?? ""
              destinationVC.transferItem = "\(values[indexPath.row].flight_number ?? 0)"
             
    
        self.navigationController?.pushViewController(destinationVC, animated: true) 
        

    }
}
}
extension FlightsViewController: FlightsViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.flightsTableView.reloadData()
        }
    }
}

    

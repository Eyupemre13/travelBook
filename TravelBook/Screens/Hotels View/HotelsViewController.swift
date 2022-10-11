//
//  HotelsViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

class HotelsViewController: UIViewController {
    @IBOutlet weak var hotelsTableView: UITableView!
    lazy var viewModel : HotelsViewModel? = HotelsViewModel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
        prepareTableView()
        
        viewModel?.delegate = self
        
        viewModel?.getData()


    }
    func prepareTableView() {
        hotelsTableView.delegate = self
        hotelsTableView.dataSource = self
        hotelsTableView.register(UINib(nibName: "HotelsTableViewCell", bundle: nil), forCellReuseIdentifier: "hotelsCell")
    }
}

extension HotelsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getArrayCount() ?? 0
       
 }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hotelsTableView.dequeueReusableCell(withIdentifier: "hotelsCell", for: indexPath) as? HotelsTableViewCell else {return UITableViewCell()}
       if let cellData = viewModel?.getItemData(indexPath: indexPath) {
            cell.configure(data: HotelsTableViewCellModel(name: cellData.name, address: cellData.address,desc: cellData.desc))
            return cell
        }
   
        return cell
    }
}
extension HotelsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC : HotelsDetailViewController = storyBoard.instantiateViewController(withIdentifier: "HotelsDetailViewController") as! HotelsDetailViewController
        destinationVC.viewModel?.hotelId = viewModel?.itemsArray?.data.body.searchResults.results[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(destinationVC, animated: true)

}
}


extension HotelsViewController: HotelsViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.hotelsTableView.reloadData()
        }
    }
}

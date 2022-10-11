//
//  SearchViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel : SearchViewModel? = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        preapreCell()
        
    }
    func preapreCell() {
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(UINib(nibName: String(describing: HotelsTableViewCell.self), bundle: nil), forCellReuseIdentifier: "hotelsCell")
        searchTableView.register(UINib(nibName: String(describing: OperationTableViewCell.self), bundle: nil), forCellReuseIdentifier: "operationCell")
        searchBar.delegate = self
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let _ = viewModel?.isEmpty {
            guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "hotelsCell", for: indexPath) as? HotelsTableViewCell else {return UITableViewCell()}
            
            cell.configure(data: HotelsTableViewCellModel(name: viewModel?.items[indexPath.row].hotelName ?? "" , address: viewModel?.items[indexPath.row].hotelAddress ?? "", desc: viewModel?.items[indexPath.row].hotelPrice ?? ""))
            
            return cell
            
            } else {
                guard let cell = searchTableView.dequeueReusableCell(withIdentifier: "operationCell", for: indexPath) as? OperationTableViewCell else {return UITableViewCell()}
                cell.cellConfigure(text: "İlgili hotelle ilgili 3 harften fazla giriniz")
                
                return cell



        }

    }
}
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC : SearchDetailViewController = storyBoard.instantiateViewController(withIdentifier: "SearchDetailViewController") as! SearchDetailViewController
        destinationVC.searchtitle = viewModel?.items[indexPath.row].hotelName ?? ""
        destinationVC.searchdesc = viewModel?.items[indexPath.row].hotelAddress ?? ""
        destinationVC.searchprice = viewModel?.items[indexPath.row].hotelPrice ?? ""
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.isEmpty) {
            viewModel?.clearData()
        }
        else {
            if(searchText.count >= 3) {
                viewModel?.getData(searchText: searchText)
            }
            
            if(searchText.count < 3) {
                print("3 Harften fazla giriniz")
            }
        }
        
    }
    
}
extension SearchViewController: SearchViewModelDelegate {
    func reloadTableView() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}



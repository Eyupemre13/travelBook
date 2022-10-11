//
//  BookmarksViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 8.10.2022.
//

import UIKit

class BookmarksViewController: UIViewController {

    @IBOutlet weak var bookmarksTableView: UITableView!
    var viewModel : BookmarkViewModel? = BookmarkViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.getData()
        bookmarksTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCell()

   
    }
    func prepareCell() {
        bookmarksTableView.delegate = self
        bookmarksTableView.dataSource = self
        bookmarksTableView.register(UINib(nibName: "HotelsTableViewCell", bundle: nil), forCellReuseIdentifier: "hotelsCell")
        
        
    }
    }
extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookmarksTableView.dequeueReusableCell(withIdentifier: "hotelsCell", for: indexPath) as? HotelsTableViewCell else {return UITableViewCell()}
        
        cell.configure(data: HotelsTableViewCellModel(name: viewModel?.items[indexPath.row].hotelName ?? "" , address: viewModel?.items[indexPath.row].hotelAddress ?? "", desc: viewModel?.items[indexPath.row].hotelPrice ?? ""))
       
        return cell
        
        }
}
extension BookmarksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC : BookmarksDetailViewController = storyBoard.instantiateViewController(withIdentifier: "BookmarksDetailViewController") as! BookmarksDetailViewController
        destinationVC.detailtitle = viewModel?.items[indexPath.row].hotelName ?? ""
        destinationVC.detaildesc = viewModel?.items[indexPath.row].hotelAddress ?? ""
        destinationVC.detailprice = viewModel?.items[indexPath.row].hotelPrice ?? ""
        self.navigationController?.pushViewController(destinationVC, animated: true)

    }

}
 

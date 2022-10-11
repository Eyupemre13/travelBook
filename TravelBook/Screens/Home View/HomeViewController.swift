//
//  ViewController.swift
//  TravelBook
//
//  Created by Eyüp Emre Aygün on 5.10.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var viewModel : HomeViewModel? = HomeViewModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCell()
        viewModel?.place()
        
}
    func prepareCell() {
        homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
    }
}
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.placeList.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let place = viewModel?.placeList[indexPath.row]
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.homeImage.image = UIImage(named: place?.place_image_name ?? "")
        cell.homeTitle.text = place?.place_lbl ?? ""
        cell.homeDesc.text = place?.place_desc_lbl ?? ""
        return cell
    }
    
    
}
extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC : HomeDetailViewController = storyBoard.instantiateViewController(withIdentifier: "HomeDetailViewController") as! HomeDetailViewController
        destinationVC.articletitle = viewModel?.placeList[indexPath.row].place_lbl ?? ""
        destinationVC.articledesc = viewModel?.placeList[indexPath.row].place_desc_lbl ?? ""
        destinationVC.articleimage = viewModel?.placeList[indexPath.row].place_image_name ?? "" 
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}


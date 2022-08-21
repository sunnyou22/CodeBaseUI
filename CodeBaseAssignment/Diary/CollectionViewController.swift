//
//  CollectionViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class CollectionViewController: BaseViewContoller {
    
    var perPageImageCount = 10
    
    var mainView = ImageSearchView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        print(#function)
        
    }
    
    override func configure() {
        mainView.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reusableIdentifier)
   
        mainView.searchBar.delegate = self
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}



extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return perPageImageCount
        //        guard let imageCount =  perPageImageCount else {
        //            print("🧨이미지가 없습니다🧨")
        //            return 0}
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        
        cell.backgroundColor = .brown
        
        return cell
    }
}

extension CollectionViewController: UISearchBarDelegate {
    
}

//
//  CollectionViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class CollectionViewController: BaseViewContoller {
    
    //    var perPageImageCount = 10
    var mainView = ImageSearchView()
    var imageURLList: [URL] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func configure() {
        mainView.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reusableIdentifier)
        
        mainView.searchBar.searchTextField.addTarget(self, action: #selector(doKeyboardDown), for: .editingDidEndOnExit)
        
        mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
 
    @objc
    func doKeyboardDown() {
        mainView.searchBar.resignFirstResponder()
        UnsplashAPIManager.shared.callRequst(page: 1, query: mainView.searchBar.text!) { json in
            UnsplashAPIManager.shared.requestUnsplashImage(json: json) { imageList in
                    
                self.imageURLList = imageList
            }
        }
        mainView.collectionView.reloadData()
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if mainView.searchBar.text == nil {
            self.imageURLList.removeAll()
            return 0
        } else if mainView.searchBar.text?.count != 0 {
            return imageURLList.count
        }
        
        //        guard let imageCount =  perPageImageCount else {
        //            print("🧨이미지가 없습니다🧨")
        //            return 0}
        return 3 // 내 옛날 인덱스 오류 찾아보기
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reusableIdentifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        let dataList = imageURLList.map { url in
            try! Data(contentsOf: url)
        }
        
        if mainView.searchBar.text == nil {
            self.imageURLList.removeAll()
        } else if mainView.searchBar.text?.count != 0 {
            cell.imageView.image = UIImage(data: dataList[indexPath.item])
            return cell
        }
        
        print(imageURLList)
        return cell
    }
}

extension CollectionViewController: UISearchBarDelegate {
    
}

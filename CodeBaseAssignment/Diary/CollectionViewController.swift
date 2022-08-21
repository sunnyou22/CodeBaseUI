//
//  CollectionViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class CollectionViewController: BaseViewContoller {
    
    var perPageImageCount = 10
    
    var mainView = BaseView()
    
    let collectionview: UICollectionView = {
        print(#function)
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 9
        let width = UIScreen.main.bounds.width - (spacing * 4)
        layout.itemSize = CGSize(width: width, height: width)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        var view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return view
    }()
    
   lazy var searchview: ImageSearchView = {
        var view = ImageSearchView()
        return view
    }()

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [searchview, collectionview].forEach { $0.addSubview(mainView) }
        collectionview.delegate = self
        collectionview.dataSource = self
        print(#function)
        
    }
    
    override func configure() {
        searchview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            //            make.bottom.equalTo(mainView.safeAreaInsets).offset(0)
        }
        
        collectionview.snp.makeConstraints { make in
            make.top.equalTo(searchview.snp.bottom).offset(0)
            make.leading.equalTo(mainView.safeAreaInsets).offset(0)
            make.trailing.equalTo(mainView.safeAreaInsets).offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
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

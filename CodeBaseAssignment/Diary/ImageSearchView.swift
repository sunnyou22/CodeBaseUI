//
//  CollectionVeiw.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class ImageSearchView: BaseView {
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "원하시는 사진의 키워드를 입력해주세요."
        
        return view
    }()
    
    let collectionView: UICollectionView = {
        let view = UICollectionView()
        
        return view
    }()
}

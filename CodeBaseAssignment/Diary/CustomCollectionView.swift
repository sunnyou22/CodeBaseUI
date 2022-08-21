//
//  collectionView.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class CustomCollectionView: UICollectionView {
    let imageView: CustomImageView = {
        let view = CustomImageView(frame: .zero)
        view.fetchImageURL(url: <#T##String#>)
    }
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
}

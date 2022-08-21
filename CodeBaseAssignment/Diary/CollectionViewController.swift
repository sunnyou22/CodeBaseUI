//
//  CollectionViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class CollectionViewController: BaseViewContoller {
    
    var rootview = BaseView() // collectionView로 바꿔줘야함
    
    override func loadView() {
        self.view = rootview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

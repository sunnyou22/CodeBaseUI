//
//  DiaryViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import UIKit

class DiaryViewController: BaseViewContoller {

    var diarymainview = DiaryView()
    
    override func loadView() {
        self.view = diarymainview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        diarymainview.goCollectionButton.addTarget(self, action: #selector(gocollectionVC), for: .touchUpInside)
    }
    
    @objc func gocollectionVC() {
       let vc = CollectionViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func setnavigationBar() {
        navigationItem.title = "선우의 다이어리"
        
        navigationItem.leftBarButtonItem
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.brown]
//        navigationController?.navigationBar.tintColor = .brown => 왜 안되지

        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemBackground
        navigationItem.scrollEdgeAppearance = barAppearance
    }
}

//
//  ViewController.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/19.
//

import UIKit

class ViewController: BaseViewContoller {

    var mainview = WriteView()
  
    override func loadView() {
        self.view = mainview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewLayoutMarginsDidChange() {
        self.mainview.recommandMovieImageView1.clipsToBounds = true
        
        self.mainview.recommandMovieImageView1.layer.cornerRadius = self.mainview.recommandMovieImageView1.frame.size.width / 2
        
    }
}


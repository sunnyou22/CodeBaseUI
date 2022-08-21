//
//  BaseVC.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/19.
//

import Foundation
import UIKit

class BaseViewContoller: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        setnavigationBar()
    }
    
    func configure() { }
    func setnavigationBar() { }
    
   static func setNavigation<T>(storyboard: String, VC: T, completion: @escaping ((T) -> ())) {
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: VC)) as? T else {
            return
        }
        completion(vc)
    }
}

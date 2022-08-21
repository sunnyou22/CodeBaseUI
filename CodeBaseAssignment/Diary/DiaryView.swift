//
//  DiaryView.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/21.
//

import Foundation
import UIKit

class DiaryView: BaseView {
    
    let imageview: CustomImageView = {
        let view = CustomImageView(frame: .zero)
        // 서버통신
        view.fetchImageURL(url: "https://i.pinimg.com/736x/a6/4b/13/a64b136846e4da45b637bf9d4c570b6d.jpg")
        return view
    }()
    
    let goCollectionButton: UIButton = {
        let view = UIButton()
        let trangitonButton = UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold)
       
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.alpha = 0.5
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.height / 2
        view.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill", withConfiguration: trangitonButton), for: .normal)
        
        return view
    }()
    
    let titleTextField: CustomTextField = {
        let view = CustomTextField()
        view.backgroundColor = .darkGray
        return view
    }()
    
    let subtitleTextField: CustomTextField = {
        let view = CustomTextField()
        view.backgroundColor = .blue
        return view
    }()
    
    let diaryTextview: CustomTextView = {
        let view = CustomTextView()
        view.backgroundColor = .cyan
        
        return view
    }()
    
    override func configureUI() {
        [imageview, goCollectionButton, titleTextField, subtitleTextField, diaryTextview].forEach { self.addSubview($0) }
    }
    
    override func setConstaints() {
        
        imageview.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(BaseView.diaryDefaultSpacing)
            make.centerX.equalTo(self)
            self.setviewsMargin(view: imageview, ratio: 3/9)
        }
        
        goCollectionButton.snp.makeConstraints { make in
            make.trailing.equalTo(imageview.snp.trailing).offset(-16)
            make.bottom.equalTo(imageview.snp.bottom).offset(-16)
            make.width.greaterThanOrEqualTo(44)
            make.height.equalTo(goCollectionButton.snp.width)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(imageview.snp.bottom).offset(BaseView.diaryDefaultSpacing)
            make.centerX.equalTo(self)
            self.setviewsMargin(view: titleTextField, ratio: 1/9)
        }
        
        subtitleTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(BaseView.diaryDefaultSpacing)
            make.centerX.equalTo(self)
            self.setviewsMargin(view: subtitleTextField, ratio: 1/9)
        }
        
        diaryTextview.snp.makeConstraints { make in
            make.top.equalTo(subtitleTextField.snp.bottom).offset(BaseView.diaryDefaultSpacing)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
            make.centerX.equalTo(self)
            self.setviewsMargin(view: diaryTextview, ratio: 4/9)
        }
    }
    
    func setviewsMargin<T: UIView>(view: T, ratio: Double) {
        view.snp.makeConstraints { make in
            let height = Int(Double((Int(UIScreen.main.bounds.height)) - (BaseView.diaryDefaultSpacing * 5)) * ratio)
            
            make.height.equalTo(height)
            make.width.equalTo(Int(UIScreen.main.bounds.width) - (BaseView.diaryDefaultSpacing * 2))
        }
    }
}


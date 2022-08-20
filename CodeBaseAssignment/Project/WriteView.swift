//
//  WriteView.swift
//  CodeBaseAssignment
//
//  Created by 방선우 on 2022/08/19.
//

import UIKit
import SnapKit

class WriteView: BaseView {
 
    let backgroundImageView: CustomImageView = {
        let view = CustomImageView(frame: .zero)
        view.fetchImageURL(url: "https://i.pinimg.com/736x/a6/4b/13/a64b136846e4da45b637bf9d4c570b6d.jpg")
        return view
    }()
    
    let gradientView: BaseView = {
        let view = BaseView()
        view.setGradient(color1: .white, color2: .black)
        view.layer.opacity = 0.4
        return view
    }()
    
    let NLabel: UILabel = {
        let view = UILabel()
        view.text = "N"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        
        return view
    }()
    
    let tvprogramButton: CustomButtonUI = {
        let view = CustomButtonUI()
        view.setupButtonLabel(title: "TV 프로그램", systemImageString: nil, fontSize: 16, fontweight: .semibold)
        
        return view
    }()
    
    let movieButton: CustomButtonUI = {
        let view = CustomButtonUI()
        view.setupButtonLabel(title: "영화", systemImageString: nil, fontSize: 16, fontweight: .semibold)
        
        return view
    }()
    
    let favoriteContentsBottom: CustomButtonUI = {
        let view = CustomButtonUI()
        view.setupButtonLabel(title: "내가 찜한 콘텐츠", systemImageString: nil, fontSize: 16, fontweight: .semibold)
        
        return view
    }()
    
    let favoriteContentsBottomWithChek: CustomButtonUI = {
        let view = CustomButtonUI()
        view.setupButtonLabel(title: "내가 찜한 컨텐츠", systemImageString: SystemName.checkmark, fontSize: 14, fontweight: .medium)
        
        return view
    }()
    
    let infoButton: CustomButtonUI = {
        let view = CustomButtonUI()
        view.setupButtonLabel(title: "정보", systemImageString: SystemName.infocircle, fontSize: 14, fontweight: .medium)
        
        return view
    }()
    
    let playButton: CustomButtonUI = {
        let view = CustomButtonUI()
        var config = UIButton.Configuration.filled()
        config.title = "재생"
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.image = UIImage(systemName: SystemName.playfill.rawValue)
        config.imagePadding = 8
        config.imagePlacement = .leading
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        return view
    }()
    
    let previewLabel: UILabel = {
        let view = UILabel()
        view.text = "미리보기"
        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 18, weight: .bold)
     
        return view
    }()
    
    let recommandMovieImageView1: CustomImageView = {
        let view = CustomImageView(frame: .zero)
//        view.setRoundImageBorder()
        view.fetchImageURL(url: "https://i.pinimg.com/736x/a6/4b/13/a64b136846e4da45b637bf9d4c570b6d.jpg")
        
        return view
    }()
    
    let recommandMovieImageView2: UIImageView = {
        let view = CustomImageView(frame: .zero)
//        view.setRoundImageBorder()
        view.fetchImageURL(url: "https://i.pinimg.com/736x/a6/4b/13/a64b136846e4da45b637bf9d4c570b6d.jpg")
        
        return view
    }()
    
    let recommandMovieImageView3: CustomImageView = {
        let view = CustomImageView(frame: .zero)
//        view.setRoundImageBorder()
        view.fetchImageURL(url: "https://i.pinimg.com/736x/a6/4b/13/a64b136846e4da45b637bf9d4c570b6d.jpg")
        view.layoutIfNeeded()
        return view
    }()
    
    
    override func configureUI() {
        [backgroundImageView, gradientView, NLabel, tvprogramButton, movieButton, favoriteContentsBottomWithChek, favoriteContentsBottom, infoButton, playButton, previewLabel, recommandMovieImageView1, recommandMovieImageView2, recommandMovieImageView3].forEach {
            self.addSubview($0)
        }
    }
    
//    override func layoutIfNeeded() {
//        let view = CustomImageView(frame: .zero)
//        view.setRoundImageBorder()
//    }
    
//    override func setNeedsDisplay(_ rect: CGRect) {
//       
//    }
    
    override func setConstaints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        gradientView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()

        }
        
        NLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(60)
            }
            
        tvprogramButton.snp.makeConstraints { make in
            make.leading.equalTo(NLabel.snp.trailing).offset(44)
            make.centerY.equalTo(NLabel)
        
        movieButton.snp.makeConstraints { make in
            make.leading.equalTo(tvprogramButton.snp.trailing).offset(0)
            make.centerY.equalTo(NLabel)
        }

        favoriteContentsBottom.snp.makeConstraints { make in
            make.leading.equalTo(movieButton.snp.trailing).offset(0)
            make.centerY.equalTo(NLabel)
        }

        recommandMovieImageView2.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            self.previewPostrImageLayout(button: recommandMovieImageView2)
        }
        

        recommandMovieImageView1.snp.makeConstraints { make in
            make.trailing.equalTo(-BaseView.recommandPosterImageSpacing)
            self.previewPostrImageLayout(button: recommandMovieImageView1)
        }

        recommandMovieImageView3.snp.makeConstraints { make in
            make.leading.equalTo(BaseView.recommandPosterImageSpacing)
            self.previewPostrImageLayout(button: recommandMovieImageView3)
        }

        previewLabel.snp.makeConstraints { make in
            make.bottom.equalTo(recommandMovieImageView1.snp.top).offset(-16)
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(16)
        }

        favoriteContentsBottomWithChek.snp.makeConstraints { make in
            make.leading.equalTo(self.safeAreaLayoutGuide).offset(44)
            make.bottom.equalTo(previewLabel.snp.top).offset(-48)
        }

        playButton.snp.makeConstraints { make in
            make.leading.equalTo(favoriteContentsBottomWithChek.snp.trailing).offset(0)
            make.centerY.equalTo(favoriteContentsBottomWithChek)
        }

        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(playButton)
            make.leading.equalTo(playButton.snp.trailing).offset(60)
        }
    }
    }

//
    func previewPostrImageLayout(button: UIImageView){
        button.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-20)
            make.width.equalTo((Int(UIScreen.main.bounds.width) - (BaseView.recommandPosterImageSpacing * 4)) / 3)
            make.height.equalTo(recommandMovieImageView2.snp.width).multipliedBy(1)
        }
    }
}

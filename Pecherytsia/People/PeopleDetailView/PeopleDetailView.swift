//
//  PeopleDetailView.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 09.10.2022.
//

import Foundation
import UIKit
import PinLayout
class PeopleDetailView: UIView {
    let topWidget = UILabel()
    let avatar = UIImageView()
    let fullNameLabel = UILabel()
    let emailButton = UIButton()
    let jobLabel = UILabel()
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            self.backgroundColor = .black
            
            self.topWidget.backgroundColor = AppColors.red
            self.topWidget.layer.masksToBounds = true
            self.topWidget.layer.cornerRadius = 25
            self.topWidget.layer.borderWidth = 5
            self.topWidget.layer.borderColor = AppColors.red.cgColor
            self.addSubview(topWidget)
            
            avatar.contentMode = .scaleAspectFill
            avatar.layer.borderWidth = 2
            avatar.layer.masksToBounds = false
            avatar.layer.borderColor = AppColors.red.cgColor
            avatar.layer.cornerRadius = UIScreen.main.bounds.height/10
            avatar.clipsToBounds = true
            topWidget.addSubview(avatar)
            //Full name
            fullNameLabel.lineBreakMode = .byTruncatingHead
            fullNameLabel.textColor = .white
            fullNameLabel.font = UIFont.systemFont(ofSize: 40)
            fullNameLabel.textAlignment = .center
            topWidget.addSubview(fullNameLabel)
            //User's email
            emailButton.contentHorizontalAlignment = .center
            topWidget.addSubview(emailButton)
            //User's job
            jobLabel.numberOfLines = 0
            jobLabel.textColor = .white
            jobLabel.lineBreakMode = .byWordWrapping
            jobLabel.font = .preferredFont(forTextStyle: .caption1)
            jobLabel.textAlignment = .center
            topWidget.addSubview(jobLabel)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            topWidget.pin.top().left(-5).width(self.frame.width+10).height(70%).marginTop(-1%)
            avatar.pin.top(safeAreaInsets.top).hCenter().width(topWidget.frame.height*0.3).height(topWidget.frame.height*0.3)
            fullNameLabel.pin.below(of: avatar).left().right().height(50)
            jobLabel.pin.below(of: fullNameLabel).left().right().height(30)
            emailButton.pin.below(of: jobLabel).left().right().height(50)
        }
}

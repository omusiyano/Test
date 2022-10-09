//
//  PeopleCell.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit
import PinLayout

class PeopleTableViewCell: UITableViewCell {
    let imageName = String()
    let avatar = UIImageView()
    let fullNameLabel = UILabel()
    let emailButton = UIButton()
    let jobLabel = UILabel()
    var userImage = String()
    let colorLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .black
        //User's Avatar
        avatar.contentMode = .scaleAspectFill
        avatar.layer.borderWidth = 2
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = AppColors.red.cgColor
        avatar.layer.cornerRadius = 50
        avatar.clipsToBounds = true
        //Full name
        fullNameLabel.lineBreakMode = .byTruncatingHead
        fullNameLabel.textColor = .white
        fullNameLabel.font = .preferredFont(forTextStyle: .headline)
        //User's email
        emailButton.contentHorizontalAlignment = .left
        //User's job
        jobLabel.numberOfLines = 0
        jobLabel.textColor = .white
        jobLabel.lineBreakMode = .byWordWrapping
        jobLabel.font = .preferredFont(forTextStyle: .caption1)
        //User's colour
        colorLabel.numberOfLines = 0
        colorLabel.textColor = .white
        colorLabel.lineBreakMode = .byWordWrapping
        colorLabel.font = .preferredFont(forTextStyle: .caption1)
        //Add it to content view
        contentView.addSubviews([avatar, fullNameLabel, emailButton, jobLabel, colorLabel])
    }
    
    private func setupConstraints(){
        avatar.pin.top(10).left(10).height(100).width(100)
        fullNameLabel.pin.top(1%).after(of: avatar).marginLeft(10).right(10).height(40)
        emailButton.pin.after(of: avatar).marginLeft(10).below(of: fullNameLabel).marginTop(1%).right(10).height(24)
        jobLabel.pin.after(of: avatar).marginLeft(10).below(of: emailButton).marginTop(1%).right(10).height(24)
        colorLabel.pin.after(of: avatar).marginLeft(10).below(of: jobLabel).marginTop(1%).right(10).height(24)
    }
}

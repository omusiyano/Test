//
//  MainPageView.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit
import PinLayout

class MainPageView: UIView {
    
    let topWidget = UILabel()
    let nameAppLabel = UILabel()
    
    let peopleButton = UIButton()
    let peopleLabelOnButton = UILabel()
    
    let roomsButton = UIButton()
    let roomsLabelOnButton = UILabel()
    
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
        
        self.topWidget.backgroundColor = .black
        self.topWidget.layer.borderColor = AppColors.red.cgColor
        self.topWidget.layer.borderWidth = 5
        self.topWidget.layer.masksToBounds = true
        self.topWidget.layer.cornerRadius = 25
        self.addSubview(topWidget)
        
        self.nameAppLabel.text = NSLocalizedString("AppName", comment: "")
        self.nameAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.nameAppLabel.numberOfLines = 3
        self.nameAppLabel.textAlignment = .center
        self.nameAppLabel.sizeToFit()
        self.nameAppLabel.textColor = AppColors.red
        topWidget.addSubview(nameAppLabel)
        
        self.addSubview(peopleButton)
        peopleButton.addSubview(peopleLabelOnButton)
        self.peopleButton.layer.masksToBounds = true
        self.peopleButton.layer.cornerRadius = 18
        self.peopleLabelOnButton.text = NSLocalizedString("People", comment: "")
        self.peopleLabelOnButton.textColor = .black
        self.peopleLabelOnButton.textAlignment = .center
        self.peopleLabelOnButton.font = UIFont.systemFont(ofSize: 30,weight: .bold)
        self.peopleLabelOnButton.backgroundColor = AppColors.red
        self.peopleLabelOnButton.contentMode = UIView.ContentMode.scaleAspectFit
        
        self.addSubview(roomsButton)
        roomsButton.addSubview(roomsLabelOnButton)
        self.roomsButton.layer.masksToBounds = true
        self.roomsButton.layer.cornerRadius = 18
        self.roomsLabelOnButton.text = NSLocalizedString("Rooms", comment: "")
        self.roomsLabelOnButton.textColor = .black
        self.roomsLabelOnButton.textAlignment = .center
        self.roomsLabelOnButton.font = UIFont.systemFont(ofSize: 30,weight: .bold)
        self.roomsLabelOnButton.backgroundColor = AppColors.red
        self.roomsLabelOnButton.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topWidget.pin.top().width(self.frame.width+10).height(20%).marginTop(-2%).left(-5).right(-5)
        nameAppLabel.pin.vCenter().hCenter().width(self.frame.width).marginTop(1%)
        
        peopleButton.pin.below(of: topWidget).hCenter().width(self.frame.width).height(10%).marginTop(30)
        peopleLabelOnButton.pin.all()
        
        roomsButton.pin.below(of: peopleButton).hCenter().width(self.frame.width).height(10%).marginTop(30)
        roomsLabelOnButton.pin.all()
    }
    
}


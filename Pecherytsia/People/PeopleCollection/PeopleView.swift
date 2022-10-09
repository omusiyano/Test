//
//  PeopleView.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import PinLayout
import UIKit

class PeopleView: UIView {
    let topWidget = UILabel()
    let nameAppLabel = UILabel()
    let peopleTableView = UITableView()
    
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
        self.addSubview(topWidget)
        
        self.nameAppLabel.text = "People"
        self.nameAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.nameAppLabel.textAlignment = .center
        self.nameAppLabel.sizeToFit()
        self.nameAppLabel.textColor = .black
        topWidget.addSubview(nameAppLabel)
        
        peopleTableView.tableFooterView = UIView()
        peopleTableView.separatorColor = AppColors.red
        peopleTableView.backgroundColor = .black
        peopleTableView.layer.cornerRadius = 25
        peopleTableView.layer.masksToBounds = true
        self.addSubview(peopleTableView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topWidget.pin.top().width(self.frame.width).height(15%).marginTop(-1%)
        nameAppLabel.pin.vCenter().hCenter().width(self.frame.width).marginTop(16%)
        peopleTableView.pin.below(of: topWidget).left(pin.safeArea).right(pin.safeArea).bottom(pin.safeArea)
    }
}

//
//  RoomsView.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import PinLayout
import UIKit

class RoomsView: UIView {
    let topWidget = UILabel()
    let nameAppLabel = UILabel()
    let roomsTableView = UITableView()
    var myCollectionView:UICollectionView?

    
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
        
        self.nameAppLabel.text = "Rooms"
        self.nameAppLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.nameAppLabel.textAlignment = .center
        self.nameAppLabel.sizeToFit()
        self.nameAppLabel.textColor = .black
        topWidget.addSubview(nameAppLabel)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let screenSize: CGRect = UIScreen.main.bounds
        layout.itemSize = CGSize(width: (screenSize.width/3-15), height: (screenSize.width/3-15))
        myCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        myCollectionView?.backgroundColor = UIColor.black
        self.addSubview(myCollectionView ?? UICollectionView())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        topWidget.pin.top().width(self.frame.width).height(15%).marginTop(-1%)
        nameAppLabel.pin.vCenter().hCenter().width(self.frame.width).marginTop(16%)
        myCollectionView!.pin.below(of: topWidget).left(pin.safeArea).right(pin.safeArea).bottom(pin.safeArea)
    }
}

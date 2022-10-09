//
//  RoomsCell.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit
import PinLayout

class RoomsTableViewCell: UICollectionViewCell {
    
    let currentStatus = String()
    let roomNumberLabel = UILabel()
    let maxOccupacyLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        setupConstraints()
    }
    
    private func setupUI(){
        self.backgroundColor = .black
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        //Room's id
        roomNumberLabel.textColor = .white
        roomNumberLabel.textAlignment = .center
        roomNumberLabel.font = .systemFont(ofSize: (self.frame.height)*0.4)
        //Room's max occupacy
        maxOccupacyLabel.numberOfLines = 0
        maxOccupacyLabel.textColor = .white
        maxOccupacyLabel.textAlignment = .center
        maxOccupacyLabel.font = .preferredFont(forTextStyle: .caption1)
        //Add it to content view
        contentView.addSubviews([roomNumberLabel, maxOccupacyLabel])
    }
    
    private func setupConstraints(){
        roomNumberLabel.pin.hCenter().vCenter().height(40%).width(100%)
        maxOccupacyLabel.pin.below(of: roomNumberLabel).left(5).right(5).height(15)
    }
}

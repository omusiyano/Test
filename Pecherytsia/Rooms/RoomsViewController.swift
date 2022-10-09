//
//  RoomsViewController.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit

class RoomsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
            
    let mainView = RoomsView()
    private let reuseIdentifierCollectionView = "Cell"
    var insertString = NSMutableAttributedString()
    let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: AppColors.red]
    var rooms = [Rooms]()
    let linkAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.preferredFont(forTextStyle: .caption1),
        .foregroundColor: UIColor.white,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        self.mainView.myCollectionView?.dataSource = self
        self.mainView.myCollectionView?.delegate = self
        self.mainView.myCollectionView?.register(RoomsTableViewCell.self, forCellWithReuseIdentifier: reuseIdentifierCollectionView)

        APIManager.getRooms{ result in
            switch result {
            case .success(let data):
                self.rooms = data
                self.mainView.myCollectionView!.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = UIScreen.main.bounds.size.width
        let h: CGFloat = self.view.frame.size.height
        self.mainView.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.rooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierCollectionView, for: indexPath) as! RoomsTableViewCell
        cell.roomNumberLabel.text = "#\(rooms[indexPath.row].id ?? "")"
        cell.maxOccupacyLabel.text = "Max: \(rooms[indexPath.row].maxOccupancy ?? 0)"
        cell.layer.borderColor = ((rooms[indexPath.row].isOccupied ?? false) ? AppColors.red.cgColor : UIColor.green.cgColor)
        cell.layer.borderWidth = 5
        return cell
    }
}


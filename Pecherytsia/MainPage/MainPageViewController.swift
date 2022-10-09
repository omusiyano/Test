//
//  MainPageViewController.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController {
    let mainView = MainPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        self.view.addSubview(mainView)
        self.mainView.peopleButton.addTarget(self, action: #selector(peoplePressed), for: .touchUpInside)
        self.mainView.roomsButton.addTarget(self, action: #selector(roomsPressed), for: .touchUpInside)
    }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = UIScreen.main.bounds.size.width
        let h: CGFloat = self.view.frame.size.height
        self.mainView.frame = CGRect(x: x, y: y, width: w, height: h)
    }

    @objc func peoplePressed(){
        let vc = PeopleViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func roomsPressed(){
        let vc = RoomsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//
//  PeopleDetailViewController.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 09.10.2022.
//

import Foundation
import UIKit
class PeopleDetailViewController: UIViewController {
    let mainView = PeopleDetailView()
    var person = People()
    let linkAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 20) ,
        .foregroundColor: UIColor.white,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        //Change view to favourite colour
        let foundedColour = (person.favouriteColor?.replacingOccurrences(of: " ", with: "-"))!
        APIManager.getColour(name: foundedColour) { result in
            switch result {
            case .success(let color):
                self.mainView.topWidget.backgroundColor = color
            case .failure(let error):
                print(error)
            }
        }
        //Set Image
        if let url = URL(string: person.avatar!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.mainView.avatar.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        //Set Name
        self.mainView.fullNameLabel.text = "\(person.firstName ?? "") \(person.lastName ?? "")"
        //Set Job
        self.mainView.jobLabel.text = "JOB: \(person.jobtitle ?? "")"
        //Set Email
        let attributeString = NSMutableAttributedString(
            string: person.email ?? "",
                attributes: linkAttributes
             )
        self.mainView.emailButton.setAttributedTitle(attributeString, for: .normal)
        self.mainView.emailButton.addTarget(self, action: #selector(emailPressed), for: .touchUpInside)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = UIScreen.main.bounds.size.width
        let h: CGFloat = self.view.frame.size.height
        self.mainView.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    @objc func emailPressed() {
        let mailtoString = ("mailto:\(String(describing: person.email))").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let mailtoUrl = URL(string: mailtoString!)!
        if UIApplication.shared.canOpenURL(mailtoUrl) {
                UIApplication.shared.open(mailtoUrl, options: [:])
        }
    }
}

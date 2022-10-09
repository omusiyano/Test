//
//  PeopleViewController.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit

class PeopleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    let mainView = PeopleView()
    private let reuseIdentifierTableView = "CellTableView"
    var insertString = NSMutableAttributedString()
    let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 20), .foregroundColor: AppColors.red]
    var people = [People]()
    let linkAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.preferredFont(forTextStyle: .caption1),
        .foregroundColor: UIColor.white,
        .underlineStyle: NSUnderlineStyle.single.rawValue
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainView)
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        
        APIManager.getPeople { result in
            switch result {
            case .success(let data):
                self.people = data
                self.mainView.peopleTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }

        mainView.peopleTableView.delegate = self
        mainView.peopleTableView.dataSource = self
        mainView.peopleTableView.register(PeopleTableViewCell.self, forCellReuseIdentifier: reuseIdentifierTableView)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = UIScreen.main.bounds.size.width
        let h: CGFloat = self.view.frame.size.height
        self.mainView.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.people.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTableView, for: indexPath) as! PeopleTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = AppColors.red
        cell.selectedBackgroundView = bgColorView
        //Name
        cell.fullNameLabel.text = "\(people[indexPath.row].firstName ?? "") \(people[indexPath.row].lastName ?? "")"
        //Email
        cell.emailButton.addTarget(self, action: #selector(emailPressed(sender:)), for: .allEvents)
        let attributeString = NSMutableAttributedString(
            string: people[indexPath.row].email!,
                attributes: linkAttributes
             )
        cell.emailButton.setAttributedTitle(attributeString, for: .normal)
        //Job
        cell.jobLabel.text = people[indexPath.row].jobtitle
        //Colour
        cell.colorLabel.text = "Favourite Color: \(people[indexPath.row].favouriteColor ?? "")"
        if let url = URL(string: people[indexPath.row].avatar!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    cell.avatar.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = PeopleDetailViewController()
        vc.person = people[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func emailPressed(sender: UIButton) {
        let mailtoString = ("mailto:\(String(describing: sender.titleLabel?.text!))").addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let mailtoUrl = URL(string: mailtoString!)!
        if UIApplication.shared.canOpenURL(mailtoUrl) {
                UIApplication.shared.open(mailtoUrl, options: [:])
        }
    }
}


//
//  ViewController.swift
//  LGStarter
//
//  Created by V K on 08.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    
    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50
    
    var cafs: [Cafeteria] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Cafeterias"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = UIColor(named: "background")
        
        
        let okenshields = Cafeteria(name: "okenshields", isFavourite: false, rating: .terrible)
        let rpcc = Cafeteria(name: "rpcc", isFavourite: false, rating: .moderate)
        let appel = Cafeteria(name: "appel", isFavourite: false, rating: .moderate)
        let becker = Cafeteria(name: "becker", isFavourite: false, rating: .moderate)
        cafs = [okenshields, rpcc, appel, becker]
        
        //Initialize tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CafTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cafs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? CafTableViewCell {
            let cafeteria = cafs[indexPath.row]
            cell.configure(caf: cafeteria)
            cell.backgroundColor = UIColor(named: "background")
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.backgroundColor = UIColor(named: "background")
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cafeteria = cafs[indexPath.row]
        cafeteria.isFavourite.toggle()
        if let cell = tableView.cellForRow(at: indexPath) as? CafTableViewCell {
            
            cell.toggleHeart(isFav: cafeteria.isFavourite)
        }
    }
}



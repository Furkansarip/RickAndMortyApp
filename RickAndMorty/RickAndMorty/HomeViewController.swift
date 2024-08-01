//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Furkan Sarı on 28.07.2024.
//

import UIKit

final class HomeViewController: UIViewController {

    let tableView = UITableView()
    var characters = [CharacterDetail]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupTableView()
        NetworkService.shared.retrieveData(endpoint: .characters, type: Characters.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.characters = data.results ?? []
                    self.tableView.reloadData()
                }
            case .failure(let _):
                print("Errorr")
            }
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
        tableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemIndigo
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as? CharacterCell else { return UITableViewCell() }
        if characters.count > 0 {
            let character = characters[indexPath.row]
            cell.setupCell(characterDetail: character)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}


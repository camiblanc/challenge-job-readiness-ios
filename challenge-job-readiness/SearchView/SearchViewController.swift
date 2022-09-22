//
//  SearchViewController.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 20/09/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    typealias Model = String
    
    private var items = [Model]()
    
    lazy var tableView: UITableView = UITableView()
    
    let searchService: SearchService = SearchService.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    private func setupView() {
        setupTableView()
//        searchService.fetchItems(input: "termos")
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "thing")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10//items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        return UITableViewCell()
    }

}

//
//  ViewController.swift
//  challenge-job-readiness
//
//  Created by Camila Evelyn Blanc Fick on 12/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        
        return searchBar
    }()
    
    // MARK: - SearchView
    
    private var items = [Item]()
    
    lazy var tableView: UITableView = UITableView()
    
    let searchService: SearchService = SearchService.shared

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Init
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setupView() {
        setupNavBar()
        view.backgroundColor = UIColor.secondaryBackground
        setupTableView()
        searchService.fetchItems(input: "termos")
    }
  
    
    private func setupNavBar() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(onCartBeenPressed))
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "thing")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    @objc private func onCartBeenPressed() {
        print("Cart has been pressed!")
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        print("Text Did Change to:", searchText)
    //        //TODO: predict category
    //    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { // called when keyboard search button pressed
        // call next view and show list of results
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10//items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thing", for: indexPath)
        
        guard let cell = cell as? HomeTableViewCell else { return UITableViewCell() }
        cell.onButtonPressed = { print("celda nro", indexPath.row) }
        cell.textLabel?.text = "Celda nro \(indexPath.row)"
        
        return cell
    }

}

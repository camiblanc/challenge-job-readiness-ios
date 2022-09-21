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

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //
    //        //fetch data-----------------
    //      }
    
    private func setupView() {
        setupNavBar()
        view.backgroundColor = UIColor.secondaryBackground
        
    }
  
    
    private func setupNavBar() {
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(onCartBeenPressed))
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


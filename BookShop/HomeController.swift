//
//  HomeController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 02/05/2024.
//


import UIKit
import Combine

class HomeController: UIViewController {
    
    //MARK: - refrences
    var viewModel: HomeViewModel = HomeViewModel()
    
    //MARK: - UI Components
    private let searchController = UISearchController(searchResultsController: nil)
//    
//    lazy var tableView: UITableView = {
//        let table = UITableView()
//          table.rowHeight = 220
//          table.dataSource = self
//          table.delegate = self
////          table.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
//          table.layer.borderColor = CGColor(genericCMYKCyan: 2, magenta: 2, yellow: 2, black: 2, alpha: 2)
//          table.backgroundColor = .clear
//          return table
//    }()
//    
//    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchController()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.fetchDataFromTheURL()
    }
    
    private func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
     
}
//MARK: - Search controller funncions
extension HomeController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text)
    }
}

//MARK: - table contents
//extension HomeController : UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        return
//    }
//    
//    
//}
//
//
//  DDTableViewController.swift
//  Digitat14Demo
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit
protocol DDListItemsLoadService {
    func loadItems(completion: @escaping (Result<[DDListItem], Error>) -> Void)
}

class DDTableViewController: UITableViewController {

    static let title = "Events"
    fileprivate var items = [DDListItem](){
        didSet{
            self.filter()
        }
    }
    
    fileprivate var searchResult = [DDListItem]()

    var service:DDListItemsLoadService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        self.navigationItem.searchController = searchController
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.searchTextField.leftView?.tintColor = .white
        self.definesPresentationContext = true
        self.title = DDTableViewController.title
        self.service?.loadItems { result in
            switch result {
            case .success(let items):
                self.items = items
                self.tableView?.reloadData()
                break
            case .failure(let error):
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                break
            }
        }
        
    }
    
    fileprivate var isSearchBarEmpty: Bool {
        return self.navigationItem.searchController?.searchBar.text?.isEmpty ?? true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.searchResult.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DDSeatGeekListTableViewCell.ReuseIdentifier, for: indexPath) as! DDSeatGeekListTableViewCell
        let item = self.searchResult[indexPath.row]
        
        //         Configure the cell...
        cell.loadData(name:
                      item.title,
                      address: item.location,
                      timestamp: item.timestamp,
                      imageUrl: item.imageUrl,
                      isFavorite: item.isFavourite)
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let cell = sender as? UITableViewCell, let indexPath = self.tableView?.indexPath(for: cell) else { return  }
        let item = self.searchResult[indexPath.row]
        if let destination = segue.destination as? DDDetailViewController{
            destination.item = item
            destination.delegate = self
        }
    }
    
    fileprivate func filter(){
        if let searchController = self.navigationItem.searchController{
            self.updateSearchResults(for:  searchController)
        }
    }
    
}

extension DDTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            self.searchResult = self.items
            self.tableView?.reloadData()
            return
        }
        let filtered = self.items.filter({$0.title.lowercased().contains(searchText.lowercased())})
        self.searchResult = filtered
        self.tableView?.reloadData()
    }
}

extension DDTableViewController : DDDetailViewControllerDelegate {
    func favoriteTapped(item: DDListItem) {
        if let firstIndex = self.items.firstIndex(where: {$0.id == item.id}){
            self.items[firstIndex].isFavourite = item.isFavourite
        }
        self.filter()
    }

}

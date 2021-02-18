//
//  ViewController.swift
//  RestApiBooks
//
//  Created by Іван Захарчук on 14.12.2020.
//

import UIKit

class BooksApiViewController: UIViewController {
    
    let networkDataFetcher = RestApiNetworkDataFetcher()
    var response: [Books]? = nil
    
    
    @IBOutlet weak var tableViewOfBooks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationController()
        setupTableView()
    }

    private func setupNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = true
    }
    
    private func setupTableView() {
        tableViewOfBooks.backgroundView?.isHidden = true
        tableViewOfBooks.delegate = self
        tableViewOfBooks.dataSource = self
        
        let urlString = "http://127.0.0.1:8000/books/"
        self.networkDataFetcher.fetchBooks(urlString: urlString) { (searchResponse) in
            guard let searchResponse = searchResponse else { return }
            self.response = searchResponse
            self.tableViewOfBooks.reloadData()
        }
    }
}

extension BooksApiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell:BookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookTableViewCell
        let books = self.response?[indexPath.row]
        cell.nameLabel.text = books?.title
        cell.authorLabel.text = books?.author
        cell.priceLabel.text = String(books?.price ?? 0)
        
        return cell
    }
}



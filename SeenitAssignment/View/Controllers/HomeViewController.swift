//
//  HomeViewController.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 09/08/21.
//

import UIKit

class HomeViewController: UIViewController  {

    @IBOutlet weak var bookListTableView: UITableView!
    private var books = [Book]()
    private var detailsVC: BookDetailsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
        loadBookList()
    }
}

//MARK:- Network
extension HomeViewController
{
    private func loadBookList()
    {
        bookListTableView.emptyTableBackground(message: "Loading...")
        ServiceManager.shared.getBookList { [weak self] (resultList, error) -> (Void) in
            self?.books = resultList ?? []
            self?.bookListTableView.reloadData()
            var emptyMsg = self?.books.isEmpty ?? false ? "No books to show" : ""
            if error != nil { emptyMsg = "Something Went Wrong, please retry."}
            self?.bookListTableView.emptyTableBackground(message:emptyMsg)
        }
    }
}

//MARK:- TableView Datasource and Delegates
extension HomeViewController: UITableViewDataSource, UITableViewDelegate
{
    private func configureTableView()
    {
        bookListTableView.dataSource = self
        bookListTableView.delegate = self
        bookListTableView.rowHeight = UITableView.automaticDimension
        bookListTableView.estimatedRowHeight = 60.0
        bookListTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"BookInfoTableViewCell") as? BookInfoTableViewCell else {
            return UITableViewCell()
        }
        cell.bindData(books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailsVC?.book = books[indexPath.row]
    }
}

//MARK:-Segue
extension HomeViewController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookDetails", let vc = segue.destination as? BookDetailsViewController
        { detailsVC = vc }
    }
}

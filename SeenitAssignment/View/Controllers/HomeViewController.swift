//
//  HomeViewController.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 09/08/21.
//

import UIKit

class HomeViewController: UIViewController  {

    @IBOutlet weak var bookListTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate
{
    private func configureTableView()
    {
        bookListTableView.dataSource = self
        bookListTableView.delegate = self
        bookListTableView.rowHeight = UITableView.automaticDimension
        bookListTableView.estimatedRowHeight = 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"BookInfoTableViewCell") as? BookInfoTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

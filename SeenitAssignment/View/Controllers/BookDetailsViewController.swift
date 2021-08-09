//
//  BookDetailsViewController.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 10/08/21.
//

import UIKit

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UITextView!
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        loadBookDetails()
    }

    func bindData()
    {
        name.text = book?.title
        author.text = "Author: \(book?.author ?? "NA")"
        price.text = "\(book?.currencyCode ?? "") \(String(book?.price ?? 0))/-"
        desc.text = book?.description
    }

    private func loadBookDetails()
    {
        desc.text = "Loading details..."
        guard let bId = book?.id else { return }
        ServiceManager.shared.getBookDetails(forBookId: bId) { [weak self] (result, error) -> (Void) in
            if let resultBook = result {
                self?.book = resultBook
                self?.bindData()
            }
        }
    }
    
}

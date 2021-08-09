//
//  BookInfoTableViewCell.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 10/08/21.
//

import UIKit

class BookInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(_ book:Book)
    {
        name.text = book.title
        author.text = "Author: \(book.author ?? "NA")"
        price.text = "\(book.currencyCode ?? "") \(String(book.price ?? 0))/-"
    }
}

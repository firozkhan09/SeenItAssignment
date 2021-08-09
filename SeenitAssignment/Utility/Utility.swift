//
//  Utility.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 10/08/21.
//

import Foundation
import UIKit

extension UITableView
{
    func emptyTableBackground(message:String)
    {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
    }
}

extension Double
{
    func currencyString(forCode code:String) -> String
    {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = code
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter.string(from: NSNumber(value: self)) ?? "\(code) \(self)"
    }
}

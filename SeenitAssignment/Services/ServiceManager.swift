//
//  ServiceManager.swift
//  SeenitAssignment
//
//  Created by Firoz khan on 10/08/21.
//

import UIKit
import Alamofire

class ServiceManager: NSObject {

    static var shared:ServiceManager = ServiceManager()
    
    func getBookList(completion:@escaping ([Book]?, NSError?)->(Void))
    {
        guard let url = URL(string: GET_BOOK_LIST) else {
            let error = NSError(domain: "", code: 404, userInfo: nil)
            completion(nil,error )
            return
        }
        let request = AF.request(url, method: .get)
        request.responseJSON { (response) in
            if let data = response.data
            {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Book].self, from: data)
                    completion(result,nil)
                } catch let error {
                    completion(nil, error as NSError)
                }
                return
            }
            completion(nil, response.error as NSError?)
        }
    }
    
    func getBookDetails(forBookId id:Int, completion:@escaping (Book?, NSError?)->(Void))
    {
        guard let url = URL(string: String(format: GET_BOOK_INFO, id)) else {
            let error = NSError(domain: "", code: 404, userInfo: nil)
            completion(nil,error )
            return
        }
        let request = AF.request(url, method: .get)
        request.responseJSON { (response) in
            if let data = response.data
            {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Book.self, from: data)
                    completion(result,nil)
                } catch let error {
                    completion(nil, error as NSError)
                }
                return
            }
            
            completion(nil, response.error as NSError?)
        }
    }
}

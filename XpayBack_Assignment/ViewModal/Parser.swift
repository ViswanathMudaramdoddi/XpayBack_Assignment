//
//  Parser.swift
//  XpayBack_Assignment
//
//  Created by Viswanath on 05/02/23.
//

import Foundation

struct Parser {
    
    func fetchData(completion: @escaping([User]) ->()){
        let api = URL(string: "https://dummyjson.com/users?limit=10&skip=0")
        guard let url = api else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{return}
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
                let result = try JSONDecoder().decode(Users.self, from: data)
                print(result.users)
                completion(result.users)
            }catch{
                print("error occurred")
            }
        }.resume()
    }
}

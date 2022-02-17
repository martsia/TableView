//
//  DataManager.swift
//  tableJSONParsing
//
//  Created by Marta Kalichynska on 15.02.2022.
//

import Alamofire

protocol PostsProvider {
    func getPosts(onSuccess: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void)
}

class DataManager: PostsProvider {
    func getPosts(onSuccess: @escaping ([Post]) -> Void, onError: @escaping (Error) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/posts", method: .get).responseDecodable(of: [Post].self) { response in
            switch response.result {
            case .success(let posts):
                onSuccess(posts)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
}

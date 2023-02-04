//
//  APICaller.swift
//  ios-cw-app
//
//  Created by Hashan on 2/3/23.
//  Copyright © 2023 Hashan. All rights reserved.
//

import Foundation

struct Constants {
    static let baseUrl = "https://5f2a-2402-d000-8108-12b5-853f-d5f9-6ead-65b2.ap.ngrok.io/"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller{
    static let shared = APICaller()
    
    func getAllFoods(completion: @escaping (Result<[Food], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)recipes") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let result = try JSONDecoder().decode([Food].self, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopFoods(completion: @escaping (Result<[Food], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)recipes/top") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let result = try JSONDecoder().decode([Food].self, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}

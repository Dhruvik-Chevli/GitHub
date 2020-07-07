//
//  NetworkManager.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 08/06/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/"
    
    let cache = NSCache<NSString,UIImage>()
    
    private init() { }
    
    func getFollowers(for username: String, page: Int, completed: @escaping(Result<[Follower],GHError>) -> Void) {
        let endpoint = baseURL+"users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _=error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
    
    
    func getUserInfo(username: String, completed: @escaping(Result<User,GHError>) -> Void) {
        
        let endpoint = baseURL+"users/\(username)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _=error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let user = try decoder.decode( User.self, from: data)
                completed(.success(user))
            }
            catch {
                completed(.failure(.invalidData))
                return
            }
        }
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping(UIImage?) ->Void ) {
        
        if let image = cache.object(forKey: NSString(string: urlString)) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self]data, response,error in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                    completed(nil)
                    return
            }
            self.cache.setObject(image, forKey: NSString(string: urlString))
            completed(image)
        }
        task.resume()
    }
    
}

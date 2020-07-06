//
//  PersistenceManager.swift
//  GitHub
//
//  Created by Dhruvik Chevli on 06/07/20.
//  Copyright © 2020 Dhruvik Chevli. All rights reserved.
//

import Foundation


enum Keys {
    static let favorites = "favorites"
}


enum PersistenceActionType {
    case add, remove
}


enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping(GHError?) -> Void) {
        retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll { $0.login == favorite.login }
                }
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GHError>) -> Void) {
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let followers = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(followers))
        } catch {
            completed(.failure(.unableToFavorite))
        }
        
    }
    
    
    static func save(favorites: [Follower])->GHError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}

//
//  PokemonService.swift
//  Pokedex-Api
//
//  Created by Derick Willians Plens Nazzoni on 23/07/19.
//  Copyright © 2019 Derick Willians Plens Nazzoni. All rights reserved.
//

import Foundation
enum Erro{
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}
enum HttpResponse: Int{
    case success = 200
    case failNotFound = 404
}
    

class PokemonService {
    
    private static let link: String = "http://pokeapi.co/api/v1/pokedex/1"
    
    class func carregaPokemon(onComplete: @escaping (Pokemon) -> Void, onError: @escaping (Erro) -> Void){
            guard let url = URL(string: link) else {
                return onError(.url)
            }
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url){ (data: Data?, response: URLResponse?, error: Error?) in
                if error == nil{
                        guard let response = response as? HTTPURLResponse else{
                        return onError(.noResponse)
    
                    }
                    if response.statusCode == HttpResponse.success.rawValue{
                        guard let data = data else {
                            return onError(.noData)
                        }
                        do{
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let pokemons = try decoder.decode(Pokemon.self, from: data)
                            onComplete(pokemons)
                        } catch{
                            onError(.invalidJSON)
                        
                        }
                    }else {
                            onError(.responseStatusCode(code: response.statusCode))
                        }
    
                }else{
                    return onError(.taskError(error: error!))
                }
            }
            task.resume()
        }
}





//
//  PokeBookRepositoryImpl.swift
//  PokemonDictionary
//
//  Created by 이건준 on 2022/03/04.
//

import RxSwift
import RxCocoa

class PokeBookRepositoryImpl: PokeBookRepository {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchPokeEntityObservable() -> Observable<Result<[PokeEntity], PokeError>> {
        guard let url = getPokemonURLComponents().url else {
            let error = PokeError.urlError
            return .just(.failure(error))
        }
        
        let request = URLRequest(url: url)
        
        return session.rx.data(request: request).map { data in
            guard let data = data.parseData(removeString: "null,") else {
                let error = PokeError.defaultError("parseData Error called")
                return .failure(error)
            }
            
            do{
                let pokeEntity = try JSONDecoder().decode([PokeEntity].self, from: data)
                return .success(pokeEntity)
            }catch{
                let error = PokeError.decodeError
                return .failure(error)
            }
        }
    }
}

extension PokeBookRepositoryImpl {
    
    struct PokeAPI {
        static let scheme = "https"
        static let host = "pokedex-bb36f.firebaseio.com"
        static let path = "/pokemon.json"
    }
    func getPokemonURLComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = PokeAPI.scheme
        components.host = PokeAPI.host
        components.path = PokeAPI.path
        return components
    }
}

extension Data{
    func parseData(removeString string: String)->Data?{
        let dataAsString = String(data: self, encoding: String.Encoding.utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

//https://pokedex-bb36f.firebaseio.com/pokemon.json

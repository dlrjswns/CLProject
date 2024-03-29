//
//  PokeCollectionViewController.swift
//  CL7_PokeCollection
//
//  Created by 이건준 on 2021/12/22.
//

import UIKit
import Alamofire
import RxSwift

private let reuseIdentifier = "cell"
//struct PokeCollection:Codable{
//    let pokeStack:[PokeStack]?
//}

class PokeCollectionViewController:UICollectionViewController{
    //MARK: -Model
    var pokemon = [Pokemon]()
    var disposeBag:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        setCollectionView()
        
        getPokemonWithRxSwift() //이 부분 에러나는 이유가 null, 때문인거같은데
            .subscribe(onNext: { pokeStack in
                print("pokeStack = \(pokeStack)")
            }, onError: { error in
                print("error = \(error.localizedDescription)")
            }, onCompleted: {
                print("completed")
            })
            .disposed(by: disposeBag)
//        getPokemonModel()
//        getPokemonWithAlamofire(url: API.BASE_URL)
        }
    
    //MARK: -Set CollectionView
    func setCollectionView(){
        self.collectionView.delegate = self // 명시하기위한 코드
        self.collectionView.dataSource = self
        self.collectionView.register(PokeCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: -Helper API
    func getPokemonWithRxSwift()->Observable<[PokeStack]?>{
        return Observable.create() { stream in
            self.getPokemon { error, pokestack in
                if let error = error{
                    stream.onError(error)
                }
                if let pokeStatck = pokestack{
                    stream.onNext(pokeStatck)
                    stream.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
    
    func getPokemon(completion: @escaping (Error?, [PokeStack]?)->()){
        guard let url = URL(string: API.BASE_URL) else { return }
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseDecodable(of: [PokeStack].self) { response in
            if let error = response.error{
                completion(error, nil)
            }
            if let data = response.value{
                completion(nil, data)
            }
        }
    }
    
    func getPokemonWithAlamofire(url:String){
        guard let url = URL(string: url) else {return}
        AF.request(url, method: HTTPMethod.get).responseJSON { response in
//            print("request = \(response.request)")
//            print("result = \(response.result)")
//            print("response = \(response.response)")
//            print("description = \(response.description)")
            switch response.result{
            case .success(let rootObject):
//                print("rootObject = \(rootObject)")
                if let rootObject = rootObject as? [[String:Any]?]{
                    for pokemonStack in rootObject{
                        print("pokemonStack = \(pokemonStack)")
                    }
                }
            case .failure(let error):
                print("error = \(error.errorDescription)")
            }
        }
    }
    
    func getPokemonModel(){
        getPokeStackWithOGSwift { pokeStacks in // Codable을 채택한 PokeStack배열을 반환받았기에
            guard let pokeStacks = pokeStacks else {return}
            for pokeStack in pokeStacks{ // for문으로 돌려 배열을 벗겨낸다
                if let name = pokeStack.name,
                   let imageUrl = pokeStack.imageUrl,
                   let description = pokeStack.description,
                   let height = pokeStack.height,
                   let weight = pokeStack.weight,
                   let attack = pokeStack.attack,
                   let type = pokeStack.type{
                    self.pokemon.append(Pokemon(name: name, imageUrl: imageUrl, description: description, height: height, weight: weight, attack: attack, type: type))
//                    print("pokemon = \(self.pokemon)")
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func getPokeStackWithOGSwift(completion: @escaping ([PokeStack]?)->()){
        DispatchQueue.global(qos: .default).async {
        guard let url = URL(string: API.BASE_URL) else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.parseData(removeString: "null,") else {return}
                do{
                    let rootObject = try JSONDecoder().decode([PokeStack].self, from: data)
                   completion(rootObject)
                }catch{
                    print("error")
                }
        }.resume()
        }
//        if let data = try? Data(contentsOf: url) {
//                    do {
//                        guard let data = data.parseData(removeString: "null,") else {return}
//                        let result = try JSONDecoder().decode([PokeStack].self, from: data)
//                        completion(result)
//                        print(result)
//                    } catch (let e) {
//                        print(e)
//                    }
//                }
    }
    
    func fetchImage(imageUrl:String, completion: @escaping (UIImage?)->()){
        DispatchQueue.global(qos: .default).async {
        guard let url = URL(string: imageUrl) else {return}
        do{
            let data = try Data(contentsOf: url)
            let pokeImage = UIImage(data: data)
            completion(pokeImage)
        }catch{
            print("fetchImage() error")
        }
        }
    }
}

//MARK: -UICollectionViewDataSource
extension PokeCollectionViewController{
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt() called")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokeCollectionCell
        let imageUrl = pokemon[indexPath.row].imageUrl
        print("imageUrl = \(imageUrl)")
//        if let pokeLabel = cell.viewWithTag(1) as? UILabel,
//           let pokeImageView = cell.viewWithTag(0) as? UIImageView{
//            pokeLabel.text = "Trash Data"
//            pokeImageView.image = UIImage(systemName: "person.fill")
//            print("success ??")
//        }
//        if let pokeImageView = cell.viewWithTag(0) as? UIImageView,
//           let pokeLabel = cell.viewWithTag(1) as? UILabel{
//            print("성공")
//        }
        fetchImage(imageUrl: imageUrl) { pokeImage in
            DispatchQueue.main.async {
            cell.pokeImageView.image = pokeImage
            }
        }
        cell.pokeLabel.text = pokemon[indexPath.row].name
        return cell
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
}

//MARK: -UICollectionViewDelegate
extension PokeCollectionViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = (self.view.frame.width-4)/3
        return CGSize(width: length, height: length)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension Data{
    func parseData(removeString string: String)->Data?{
        let dataAsString = String(data: self, encoding: String.Encoding.utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}

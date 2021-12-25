//
//  PokeCollectionViewController.swift
//  CL7_PokeCollection
//
//  Created by 이건준 on 2021/12/22.
//

import UIKit

private let reuseIdentifier = "cell"
//struct PokeCollection:Codable{
//    let pokeStack:[PokeStack]?
//}

class PokeCollectionViewController:UICollectionViewController{
    //MARK: -Model
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        setCollectionView()
        getPokemonModel()
        }
    
    //MARK: -Set CollectionView
    func setCollectionView(){
        self.collectionView.delegate = self // 명시하기위한 코드
        self.collectionView.dataSource = self
        self.collectionView.register(PokeCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //MARK: -Helper API
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
    
    func fetchImage(imageUrl:String, completion: (UIImage?)->()){
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

//MARK: -UICollectionViewDataSource
extension PokeCollectionViewController{
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
            cell.pokeImageView.image = pokeImage
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
        return CGSize(width: 50, height: 50)
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

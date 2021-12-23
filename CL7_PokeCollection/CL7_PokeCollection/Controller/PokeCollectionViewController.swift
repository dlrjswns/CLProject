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
struct PokeStack:Decodable{
//    let attack:Int
//    let defense:Int
//    let description:String
//    let evolutionChain:[EvolutionResult]
//    let height:Int
//    let id:Int
//    let imageUrl:String
//    let name:String
//    let type:String
//    let weight:Int
    let name:String?
    let imageUrl:String?
    let description:String?
    let height:Int?
    let weight:Int?
    let attack:Int?
    let type:String?
    let evolutionChain:[EvolutionChain]?
}
struct EvolutionChain:Decodable{
    let id:String
    let name:String
}
class PokeCollectionViewController:UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemBackground
        
        setCollectionView()
            getAPIWithOGSwift()
        }
    
    //MARK: -Helper API
    func getAPIWithOGSwift(){
//        let url:URL! = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")
//        let data = try! Data(contentsOf: url)
//
//        do{
//            let rootObject = try JSONSerialization.jsonObject(with: data, options: []) as! [AnyObject]
//            print("rootObject = \(rootObject)")
////            for infor in rootObject{
////                let pokeInfor = infor as! [String:Any]
////                if let pokeName = pokeInfor["name"] as? String{
////                print("pokeName = \(pokeName)")
////                }
////            }
//
//        }catch{
//
//        }
        
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else {return}

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.parseData(removeString: "null,") else {return}
                do{
                    let result = try JSONDecoder().decode([PokeStack].self, from: data)
                    print("result = \(result)")
                }catch{
                    print("error")
                }
//                    do {
//                        //받은 json데이터 파싱
//                        let result = try JSONDecoder().decode(PokeCollection.self, from: data)
//                        print("result = \(result)")
//                    } catch(let e) {
//                        print(e)
//                    }
        }.resume()
    }
    
    //MARK: -Set CollectionView
    func setCollectionView(){
        self.collectionView.delegate = self // 명시하기위한 코드
        self.collectionView.dataSource = self
        self.collectionView.register(PokeCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

//MARK: -UICollectionViewDataSource
extension PokeCollectionViewController{
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PokeCollectionCell
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
        cell.pokeLabel.text = "dfsdf"
        
        return cell
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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

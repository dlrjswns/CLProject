//
//  Artists.swift
//  CL5_Artistry
//
//  Created by 이건준 on 2021/12/15.
//

import Foundation
import Alamofire

struct Artist{
    let imageName:String // Artist 이미지이름
    let artistName:String //Artist 이름
    let artistBio:String //Artist 설명
    let works:[Work] // 해당 미술가의 작품들
    
    static func getArtistFromBundle()->[Artist]{
        var artists = [Artist]()
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else{ print("url error"); return artists }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {print(error); return}
            do{
                if let rootObject = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any],
                   let artistArray = rootObject["artists"] as? [[String:AnyObject]]{
                    for artistInfor in artistArray{
                        var artistWorks = [Work]()
                        if let bio = artistInfor["bio"] as? String,
                           let image = artistInfor["image"] as? String,
                           let name = artistInfor["name"] as? String,
                           let works = artistInfor["works"] as? [[String:Any]]{
                            
                            for work in works{
                                if let info = work["info"] as? String,
                                   let image = work["image"] as? String,
                                   let title = work["title"] as? String{
                                    artistWorks.append(Work(image: image, info: info, title: title))
                                }
                            }
                            artists.append(Artist(imageName: image, artistName: name, artistBio: bio, works: artistWorks))
                        }
                    }
                }
//                print("artists = \(artists)")
                }catch{
                    print("getArtistFromBundle() error")
                }
//            print("artists = \(artists)")
            }
        task.resume()
        print("artists = \(artists)")
        return artists
        }
    }


//
//  Beer.swift
//  CL_BringBeer
//
//  Created by 이건준 on 2022/01/20.
//

import Foundation

struct Beer:Codable{
    let id:Int?
    let name:String?
    let tagline:String?
    let firstBrewed:Date?
    let description:String?
    let imageURL:String?
    let abv, ibu, targetFG, targetOG, ebc, srm, ph, attenuationLevel:Double?
    let volume:[BeerVolume]?
    let method:BeerMethod?
    let ingredients:BeerIngredient?
    let foodParing:[String]?
       
    
    enum CodingKeys:String, CodingKey{
        case id, name, tagline, description, abv, ibu, ebc, srm, ph, volume, method, ingredients, foodParing
        case firstBrewed = "first_brewed"
        case imageURL = "image_url"
        case targetFG = "target_fg"
        case targetOG = "target_og"
        case attenuationLevel = "attenuation_level"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let firstBrewed = try values.decode(String.self, forKey: .firstBrewed)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-yyyy"
        
        self.id = try? values.decode(Int.self, forKey: .id)
        self.name = try? values.decode(String.self, forKey: .name)
        self.tagline = try? values.decode(String.self, forKey: .tagline)
        self.firstBrewed = try? dateFormatter.date(from: firstBrewed) ?? Date()
        self.description = try? values.decode(String.self, forKey: .description)
        self.imageURL = try? values.decode(String.self, forKey: .imageURL)
        self.abv = try? values.decode(Double.self, forKey: .abv)
        self.ibu = try? values.decode(Double.self, forKey: .ibu)
        self.targetFG = try? values.decode(Double.self, forKey: .targetFG)
        self.targetOG = try? values.decode(Double.self, forKey: .targetOG)
        self.ebc = try? values.decode(Double.self, forKey: .ebc)
        self.srm = try? values.decode(Double.self, forKey: .srm)
        self.ph = try? values.decode(Double.self, forKey: .ph)
        self.volume = try? values.decode([BeerVolume].self, forKey: .volume)
        self.method = try? values.decode(BeerMethod.self, forKey: .method)
        self.ingredients = try? values.decode(BeerIngredient.self, forKey: .ingredients)
        self.foodParing = try? values.decode([String].self, forKey: .foodParing)
        self.attenuationLevel = try? values.decode(Double.self, forKey: .attenuationLevel)
    }
}

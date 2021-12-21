//
//  ForCandy.swift
//  CL6_CandySearch
//
//  Created by 이건준 on 2021/12/18.
//

import UIKit

final class ForCandy{
    static func getCandies()->[Candy]{
        let candies:[Candy] = [
            Candy(candyName: "Chocolate Bar", candyType: "Chocolate", candyImage: UIImage(named: "Chocolate Bar.png")!), Candy(candyName: "Chocolate Chip", candyType: "Chocolate", candyImage: UIImage(named: "Chocolate Chip.png")!), Candy(candyName: "Dark Chocolate", candyType: "Chocolate", candyImage: UIImage(named: "Dark Chocolate.png")!), Candy(candyName: "Lollipop", candyType: "Hard", candyImage: UIImage(named: "Lollipop.png")!), Candy(candyName: "Candy Cane", candyType: "Hard", candyImage: UIImage(named: "Candy Cane.png")!), Candy(candyName: "Jaw Breaker", candyType: "Hard", candyImage: UIImage(named: "Jaw Breaker.png")!), Candy(candyName: "Caramel", candyType: "Other", candyImage: UIImage(named: "Caramel.png")!), Candy(candyName: "Sour Chew", candyType: "Other", candyImage: UIImage(named: "Sour Chew.png")!), Candy(candyName: "Gummi Bear", candyType: "Other", candyImage: UIImage(named: "Gummi Bear.png")!)
        ]
        
        return candies
    }
}

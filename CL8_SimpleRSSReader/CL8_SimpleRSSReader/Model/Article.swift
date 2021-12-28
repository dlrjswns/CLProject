//
//  Article.swift
//  CL8_SimpleRSSReader
//
//  Created by 이건준 on 2021/12/28.
//

import UIKit

struct Article {
    let title:String
    let description:String
    let pubDate:String
    var isExpand:Bool
    
    static func getArticles()->[Article]{
        let articles:[Article] = [
            Article(title: "Apple Reports Second Quarter Results", description: "Apple today announced financial results for its fiscal 2016 second quarter ended March 26. The company posted quarterly revenue of $50.6 billion and quarterly net income of $10.5 billion, or $1.90 per diluted share. These results compare to revenue of $58 billion and net income of $13.6 billion, or $2.33 per diluted share, in the year-ago quarter. Gross margin was 39.4 percent compared to 40.8 percent in the year-ago quarter. International sales accounted for 67 percent of the quarter’s revenue. “Our team executed extremely well in the face of strong macroeconomic headwinds,” said Tim Cook, Apple’s CEO. “We are very happy with the continued strong growth in revenue from Services, thanks to the incredible strength of the Apple ecosystem and our growing base of over 1 billion active devices.”", pubDate: "Tue, 26 Apr 2016 14:44:21 PDT", isExpand: false),
            Article(title: "Final Cut Pro X helps small company delight world’s biggest clients", description: "When Trim Editing started creating music videos over a decade ago, just paying the rent was a huge accomplishment. Now, the small East London company is crafting award-winning visuals for big brands — like Audi, Nike, Adidas, and Guinness — propelled by the power of Final Cut Pro X. The video editing software’s comprehensive features allow Trim Editing to organize film and audio clips, pull together compelling projects, and make changes on the fly. “When I’m playing back an edit for a director, they’ll say, ‘Okay, let’s go and make those changes I talked about.’ I’ll say, ‘Oh, no, they’re already done,’ and we’ll jump back and watch it again. People can’t believe that I’ve magically done the change before we even finish playback,” says editor Thomas Grove Carter.", pubDate: "Wed, 20 Apr 2016 10:05:59 PDT", isExpand: false)
        ]
        return articles
    }
}

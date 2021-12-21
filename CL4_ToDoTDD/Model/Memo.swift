//
//  Memo.swift
//  CL4_ToDoTDD
//
//  Created by 이건준 on 2021/12/12.
//

import Foundation

class Memo{
    let title:String
    let comment:String
    let date:Date
    
    init(title:String, comment:String, date:Date) {
        self.title = title
        self.comment = comment
        self.date = date
    }
}

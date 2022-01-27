//
//  Member.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/14.
//

import Foundation

struct Member:Codable {
    var id:Int?
    var name:String?
    var avatar:String?
    var job:String?
    var age:Int?
    
    enum CodingKeys:String, CodingKey{
        case id, name, avatar, job, age
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? values.decode(Int.self, forKey: .id)
        self.name = try? values.decode(String.self, forKey: .name)
        self.avatar = try? values.decode(String.self, forKey: .avatar)
        self.job = try? values.decode(String.self, forKey: .job)
        self.age = try? values.decode(Int.self, forKey: .age)
    }
}

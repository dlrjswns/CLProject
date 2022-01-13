//
//  MemberService.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/14.
//

import UIKit

class MemberService{
    let memberRepository = APIRepository()
    
    func fetchMemberModel(completion: @escaping ([MemberModel])->Void){
        var memberModels:[MemberModel] = []
        memberRepository.getMember { members in
//            print("members = \(members)")
            members.map { [weak self] member in
                self?.fetchImage(member.avatar) { image in
//                    print("image = \(image)")
                    let memberModel = MemberModel(name: member.name, avatar: image, job: member.job)
//                    print("memberModel = \(memberModel)")
                    memberModels.append(memberModel)
                }
            }
        }
        completion(memberModels)
        print("memberModels = \(memberModels)")
    }
    
    private func fetchImage(_ imageName:String?, completion:@escaping (UIImage?)->Void){
        guard let imageName = imageName,
              let imageUrl = URL(string: imageName) else {return}
        DispatchQueue.global(qos: .default).async {
            let imageData = try! Data(contentsOf: imageUrl)
            let fetchImage = UIImage(data: imageData)
            completion(fetchImage)
        }
    }
}

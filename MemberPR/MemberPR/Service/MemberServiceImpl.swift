//
//  MemberService.swift
//  MemberPR
//
//  Created by 이건준 on 2022/01/14.
//

import RxSwift

class MemberServiceImpl: MemberService{
//    let memberRepository = APIRepository()
//    
//    func fetchMemberModel(completion: @escaping ([MemberModel])->Void){
//        var memberModels:[MemberModel] = []
//        memberRepository.getMember { members in
////            print("members = \(members)")
//            members.map { [weak self] member in
//                self?.fetchImage(member.avatar) { image in
////                    print("image = \(image)")
//                    let memberModel = MemberModel(name: member.name, avatar: image, job: member.job)
////                    print("memberModel = \(memberModel)")
//                    memberModels.append(memberModel)
//                }
//            }
//        }
//        completion(memberModels)
//        print("memberModels = \(memberModels)")
//    }
    private let memberRepository:MemberRepository
    
    var memberModels : [MemberModel] = []
    
    init(memberRepository:MemberRepository) {
        self.memberRepository = memberRepository
        print("sucdsfcdsscd")
    }
    
    func getMemberModel() -> Observable<Result<[MemberModel], MemberError>>{
        memberRepository.getMember()
            .map { result in
                switch result{
                    case .success(let members):
                        return .success(self.parseData(members: members))
                    case .failure(let memberError):
                        return .failure(memberError)
                }
            }
    }
    
    private func parseData(members:[Member]) -> [MemberModel]{
//        var memberModels:[MemberModel] = []
//        _ = members.map { [weak self] member in
//            self?.fetchImage(member.avatar) { fetchImage in
//                guard let fetchImage = fetchImage else { return }
//                let memberModel = MemberModel(name: member.name ?? "", avatar: fetchImage, job: member.job ?? "")
//                memberModels.append(memberModel)
//                }
//            }
//            return memberModels
        
        _ = members.map { member in
            fetchImage(member.avatar) { [weak self] fetchImage in
                if let fetchImage = fetchImage{
                    let memberModel = MemberModel(name: member.name ?? "", avatar: fetchImage, job: member.job ?? "")
//                    memberModels.append(memberModel)
                    self?.memberModels.append(memberModel)
                }
            }
        }
        return memberModels
    }
    
    private func fetchImage(_ imageName:String?, completion:@escaping (UIImage?)->Void){
        guard let imageName = imageName,
              let imageUrl = URL(string: imageName) else { return }
        
        DispatchQueue.global(qos: .default).async {
            do{
                let imageData = try Data(contentsOf: imageUrl)
                let fetchImage = UIImage(data: imageData)
                completion(fetchImage)
            }catch{
                print(MemberError.defaultError("fetchImage Error").message)
            }
        }
    }
}

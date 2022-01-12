//
//  OrderViewModel.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/09.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class OrderViewModel{
    var fetchMenus : BehaviorRelay<[OrderMenu]> = BehaviorRelay(value: [])
    var orderService = OrderService()
    var disposeBag = DisposeBag()
    
//    func changeEntitytoModel()->Observable<[OrderMenu]>{
//        orderService.changeEntitytoModel { orderMenus in
//            fetchMenus.accept(orderMenus)
//        }
//    }
    init(){
        //TableCell 초기데이터설정
        orderService.changeEntitytoModel { [weak self] orderMenus in
            self?.fetchMenus.accept(orderMenus)
        }
    }
    
    func changeCount(_ orderMenu:OrderMenu, _ changeCnt:Int){
        fetchMenus.map { orderMenus in
            orderMenus.map { oderMenu in
                
            }
        }
        let changeOrderMenu = OrderMenu(name: orderMenu.name, price: orderMenu.price, count: orderMenu.count! + changeCnt)
        fetchMenus.accept([changeOrderMenu])
    }
}

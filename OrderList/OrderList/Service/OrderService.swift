//
//  OrderService.swift
//  OrderList
//
//  Created by 이건준 on 2022/01/12.
//

import Foundation

class OrderService{
    let orderRepository = API()
    
    func changeEntitytoModel(completion: @escaping ([OrderMenu])->Void){
        orderRepository.getOrderListAF { error, menus in
            guard let menus = menus,
                  error == nil else { return }
            
            var orderMenus : [OrderMenu] = []
            menus.map { menu in
                let orderMenu = OrderMenu(name: menu.name, price: menu.price, count: 0)
                orderMenus.append(orderMenu)
            }
            
            completion(orderMenus)
        }
    }
}

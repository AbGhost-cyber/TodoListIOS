//
//  ItemModel.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/22.
//

import Foundation
struct ItemModel: Identifiable{
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
}
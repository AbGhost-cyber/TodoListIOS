//
//  ListViewModelProtocols.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/23.
//

import Foundation

protocol ListViewModelProtocols {
    
    func deleteItem(position:IndexSet)
    
    func moveItem(from:IndexSet, to:Int)
    
    func addItem(title:String)
    
    func updateItem(item:ItemModel)
    
    func saveItems()
}

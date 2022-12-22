//
//  ListViewModel.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/22.
//

import Foundation

class ListViewModel : ObservableObject {
    @Published var items:[ItemModel] = []
    
    init() {
        getAllItems()
    }
    
    func getAllItems(){
        let newItems = [
            ItemModel(title: "This is the first title", isCompleted: false),
            ItemModel(title: "This is the second title", isCompleted: false),
            ItemModel(title: "This is the third title", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(position:IndexSet){
        items.remove(atOffsets: position)
    }
    func moveItem(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}

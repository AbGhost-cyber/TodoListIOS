//
//  ListViewModel.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/22.
//

import Foundation

class ListViewModel : ListViewModelProtocols, ObservableObject {
    
    @Published var items:[ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey:String = "items_list"
    
    init() {
        getAllItems()
    }
    
    func getAllItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems
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

    func updateItem(item:ItemModel) {
       if let index = items.firstIndex(where: { existingItem in
           existingItem.id == item.id
       }){
           items[index] = item.updateCompletion()
       }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder()
            .encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

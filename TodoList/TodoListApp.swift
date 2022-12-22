//
//  TodoListApp.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/20.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}

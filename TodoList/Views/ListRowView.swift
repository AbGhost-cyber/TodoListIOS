//
//  ListRowView.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/20.
//

import SwiftUI

struct ListRowView: View {
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?
                  "checkmark.circle" :"circle")
            .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
                .foregroundColor(item.isCompleted ? .gray : .black)
                .strikethrough(item.isCompleted)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "Hi", isCompleted: true)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
        }
        .previewLayout(.sizeThatFits)
    }
}

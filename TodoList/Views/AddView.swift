//
//  AddView.swift
//  TodoList
//
//  Created by dremobaba on 2022/12/20.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State private var textFieldText:String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("type something here....",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
    }
    
    func saveButtonPressed(){
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}

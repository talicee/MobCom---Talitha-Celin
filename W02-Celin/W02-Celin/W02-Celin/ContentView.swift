//
//  ContentView.swift
//  W02-Celin
//
//  Created by student on 22/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var fruitStates: [FruitState] = [
        FruitState(isFilled: false, isOn: false),
        FruitState(isFilled: false, isOn: false),
        FruitState(isFilled: false, isOn: false),
        FruitState(isFilled: false, isOn: false),
        FruitState(isFilled: false, isOn: false)
    ]
    
    let fruits = ["Do Homework", "Jogging", "Feed the Fish", "Eat Apple", "Take a Nap"]
    
    struct FruitState {
        var isFilled: Bool
        var isOn: Bool
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.green)
                .shadow(radius: 10)
                .frame(width: 500, height: 80)
                .opacity(0.2)
            
            Text("To Do List 📋")
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        
        HStack {
            TextField("Enter a task", text: $name) //untuk menulis task yang mau diadd
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Add Task") { //untuk add task ke list
                print("Added Task")
            }
            .buttonStyle(.bordered)
            .tint(.blue)
            .frame(width: 120)
        }
        
        List(fruits.indices, id: \.self) { index in
            HStack {
                VStack {//star untuk prioritas tugas
                    Image(systemName: fruitStates[index].isFilled ? "star.fill" : "star")
                        .foregroundColor(fruitStates[index].isFilled ? .yellow : .gray)
                        .onTapGesture {
                            fruitStates[index].isFilled.toggle()
                        }
                }
                
                Text(fruits[index])
                Spacer()
                Toggle("", isOn: $fruitStates[index].isOn) //menandakan sudah dikerjakan
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  TaskListView.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

import SwiftUI

struct TaskListView: View {
    @State private var vm = TaskViewModel()
    @State private var newTask = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    TextField("New Task", text:
                                $newTask).textFieldStyle(
                                    .roundedBorder)
                    Button("Add"){
                        vm.add(newTask)
                        newTask = ""
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(newTask
                        .trimmingCharacters(in:
                        .whitespaces).isEmpty)
                                    
                }.padding()
                
                //nyambung dari taskviewmodel
                List{
                    ForEach(vm.tasks) {task in
                        HStack{
                            Image(systemName:
                                task.isCompleted ?
                                "checkmark.circle.fill" :
                                "checkmark.circle")
                            .foregroundStyle(task.isCompleted ? .green :.secondary)
                            .onTapGesture{vm.toggle(task)}
                            
                            Text(task.title)
                                .strikethrough(task.isCompleted) //kalo task selesai
                        }
                    }.onDelete(perform: vm.remove)
                }.listStyle(.inset)
            }
        }
        .navigationTitle("Tasks")
        .padding()
    }
}

#Preview {
    TaskListView()
}

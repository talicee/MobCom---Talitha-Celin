//
//  ContentView.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

// Model - ViewModel - View (swiftui structure)

// model itu datannya
import SwiftUI

struct ContentView: View {
    @State private var vm = CounterVM()
    //kerjanya view, itu gaboleh jalan hitung"an, ubah variable, ubah nilai
    //tidak boleh melakukan apa", krn semua function, source of root di VIEWMODEL (yg lakuin semua)
    //disini hanya NAMPILIN atau manggil function
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 16){
                Text("Count:  \(vm.count)")
                    .font(.largeTitle).bold()
                
                Text(vm.isEven ? "Even" : "Odd")
                    .foregroundStyle(.secondary)
                
                HStack{
                    Button("+") {vm.increment()}
                        .buttonStyle(.bordered)
                    Button("-") {vm.decrement()}
                        .buttonStyle(.bordered)
                }
                
                Button("Reset") {vm.reset()}
                    .buttonStyle(.borderedProminent)
                
                NavigationLink("Mirror Screen"){
                    CounterMirrorView(vm:vm)
                    //vm:vm artinya vm yg ada di countervm sama dengan state vm
                    //yg kiri mirrowview, yg kanan punyanya home
                }
            }
        }
    }
}

struct CounterMirrorView: View {
    var vm: CounterVM
    
    var body: some View {
        VStack(spacing : 16){
            Text("Mirror Count: \(vm.count)")
            Button("Add Here") {vm.increment()}
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
            

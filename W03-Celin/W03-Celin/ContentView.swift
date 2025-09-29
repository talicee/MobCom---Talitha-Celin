//
//  ContentView.swift
//  W03-Talitha
//
//  Created by student on 29/09/25.
//

import SwiftUI

import SwiftUI
struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home" ,
                        systemImage: "house.fill")
                }
                .tag(0)
                .badge("9")
            
            SearchView()
                .tabItem{
                    Label("Search",
                          systemImage: "magnifyingglass")
                }
            
            SearchView()
                .tabItem{
                    Label("Profile",
                          systemImage: "person.circle")
                }
            SearchView()
                .tabItem{
                    Label("Settings",
                          systemImage: "gear")
                }
        }
        .tint(.blue)
    }
}
struct HomeView:View{
    @State private var textKu = ""
    var body: some View{
        Form{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Good Morning,")
                        .font(.headline)
                    Text("Talitha")
                        .font(.title.bold())
                }
                .padding(.bottom,20)
                .padding(.top,10)
                
                Spacer()
                
                Image("catt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .padding(.top,10)
            }
            .padding(.top,10)
            
            TextField("Search", text: $textKu)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .gray.opacity(0.4), radius: 3, x: 2, y: 2)
                .frame(width: 300, height: 10)
                .padding(.top,5)
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.cyan, .green.opacity(0.4)]),
                            center: .top,
                            startRadius: 60,
                            endRadius: 200
                        )
                    )
                    .frame(width: 300, height: 200)
                
                VStack{
                    HStack{
                        Text("Today's Goal")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                    }
                    
                    HStack(spacing: 20){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 0.1)
                                )
                                .frame(width: 120, height: 130)
                            
                            VStack{
                                Image(systemName: "figure.run")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                
                                Text("4 Miles")
                                    .font(.headline.bold())
                                    .foregroundStyle(.white)
                                    .padding(.top,0.5)
                                
                                Text("Thames Route")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.2))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white, lineWidth: 0.1)
                                )
                                .frame(width: 120, height: 130)
                            
                            VStack{
                                Image(systemName: "bicycle")
                                    .font(.system(size: 50))
                                    .foregroundColor(.white)
                                
                                Text("2 Miles")
                                    .font(.headline.bold())
                                    .foregroundStyle(.white)
                                    .padding(.top,0.5)
                                
                                Text("River Lea")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
            }
            .padding(.top,20)
            
            HStack{
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.3), lineWidth: 3)
                        )
                        .frame(width: 130, height: 90)
                    
                    VStack{
                        Text("❤️")
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            
                            
                        Text("68 Bpm")
                            .font(.subheadline)
                            .padding(.leading, 60)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .padding(.top,20)
                }
                
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.3), lineWidth: 3)
                        )
                        .frame(width: 130, height: 90)
                    
                    VStack{
                        Text("🔥")
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            
                            
                        Text("0 Kcal")
                            .font(.subheadline)
                            .padding(.leading, 60)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .padding(.top,20)
                }
            }
            
            HStack{
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.3), lineWidth: 3)
                        )
                        .frame(width: 130, height: 90)
                    
                    VStack{
                        Text("🧍🏻")
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            
                            
                        Text("73 Kg")
                            .font(.subheadline)
                            .padding(.leading, 70)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .padding(.top,20)
                }
                
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.cyan.opacity(0.2))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.3), lineWidth: 3)
                        )
                        .frame(width: 130, height: 90)
                    
                    VStack{
                        Text("😴")
                            .padding(.trailing,60)
                            .padding(.bottom,10)
                            
                            
                        Text("6.2 Hrs")
                            .font(.subheadline)
                            .padding(.leading, 70)
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .padding(.top,20)
                }
            }
        }
        .padding()
        .background(.cyan.opacity(0.2))
    }
}
struct SearchView:View{
    var body: some View{
        VStack{
            Text("👀 Search!")
                .font(Font.largeTitle)
        }
    }
}
    
#Preview {
    ContentView()
}

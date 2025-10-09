//
//  Genre.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

import Foundation

struct Genre: Identifiable, Codable, Hashable{
    let id = UUID() //id bisa pake let,karena tidak akan berubah, valuenya kalo udah dibikin ga bisa berubah 
    var name: String
    var colorHex: String
    
    static let all:[Genre] = [
        .init(name: "Action" , colorHex: "#E80E2F"),
        .init(name: "Romance", colorHex: "#0EEB19")
    ]
}

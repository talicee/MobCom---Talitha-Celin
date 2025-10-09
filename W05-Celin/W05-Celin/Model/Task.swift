//
//  Task.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

// Model hrs matang diawal <<< FIX DIAWAL
// ViewModel << bergerak
// View << bergerak


//disini HANYA DECLARASI STRUCTURENYA, pake var apa aja
import Foundation

struct Task: Identifiable, Codable, Hashable {
    var id: UUID = UUID() //kalo pake :, kita declare dia var tipe UUID, kalo = dikasih UUID dari sananya (kalo males tulis UUID kasih =)
    var title: String
    var isCompleted: Bool = false //false nilai default
    
    
}

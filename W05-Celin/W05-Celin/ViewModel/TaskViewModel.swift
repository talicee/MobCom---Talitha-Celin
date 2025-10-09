//
//  TaskViewModel.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

//sebisa mungkin nama file view dan model adakata view model/view sesuai file dmn

import Foundation
import Observation
import SwiftUI

@Observable

final class TaskViewModel{
    var tasks: [Task] = [  
        .init(title: "Beli Booster"),
        .init(title: "Beli Celana Baru" , isCompleted: true)
    ]
    
    func add(_ title: String){
        let clean = title.trimmingCharacters(in: .whitespacesAndNewlines) //hilangin spasi, krn senstive
        if clean.isEmpty { return }
        tasks.append(.init(title: clean))
    }
    
    func remove(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    func toggle(_ task: Task){ //first index -> mengembalikan index mana , index keberapa yg idnya kondisinya 0.id == task.id,
        //first index-> mengembalikan id pertama yg sama dengan koleksi taskmu
        
        if let idx = tasks.firstIndex(where: { $0.id == task.id }){
            tasks[idx].isCompleted.toggle()
        }
    }
}

//
//  CounterVM.swift
//  W05-Celin
//
//  Created by student on 09/10/25.
//

import Foundation
import SwiftUI

@Observable //observable, dia bisa dipanggil dimanapun diabutuh
final class CounterVM{
    var count: Int = 0 //if published,kalo variable berubah, tampilannya akan direset berubaha, ios 17 ternyata tidak perlu di published, udah observe semuanya
    var isEven: Bool { count % 2 == 0}
    
    func increment(){count += 1}
    
    func decrement(){count -= 1}
    
    func reset(){count = 0}
}

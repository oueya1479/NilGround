//
//  SpotCellViewModel.swift
//  NilGround
//
//  Created by κΉλν on 2022/07/08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpotCellViewModel: ObservableObject, Identifiable {
    @Published var spot: Spot
    
    init(spot: Spot) {
        self.spot = spot
    }
}

//
//  SpotListViewModel.swift
//  NilGround
//
//  Created by κΉλν on 2022/07/08.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class SpotListViewModel: ObservableObject {
    @Published var spotRepository = SpotRepository()
    @Published var spotcellViewModels = [SpotCellViewModel]()
    
}

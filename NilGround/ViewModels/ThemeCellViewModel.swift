//
//  ThemesViewModel.swift
//  NilGround
//
//  Created by κΉλν on 2022/07/05.
//

import Foundation
import Combine
import SwiftUI

class ThemeCellViewModel: ObservableObject, Identifiable {
    @Published var theme: Theme
    var id = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(theme: Theme) {
        self.theme = theme
        $theme.compactMap { theme in
            theme.id
        }
        .assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}

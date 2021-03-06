//
//  ThemeListViewModel.swift
//  NilGround
//
//  Created by 김동헌 on 2022/07/05.
//

import SwiftUI
import Foundation
import Combine

class ThemeListViewModel: ObservableObject {
    @Published var themeRepository = ThemeRepository()
    @Published var themeCellViewModels = [ThemeCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        themeRepository.$themes
            .map { themes in
                themes.map { theme in
                    ThemeCellViewModel(theme: theme)
                }
            }
            .assign(to: \.themeCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func loadThemes() {
        themeRepository.loadThemes()
    }
    
    func getTheme(id: String) -> Theme {
        if let theme = themeRepository.getTheme(id) { return theme }
        else { return Theme(title: "없음", description: "없음", image: "없음") } 
    }
    
    func addTheme(theme: Theme, compleationHandler: @escaping () -> Void) {
        themeRepository.addTheme(theme) {
            compleationHandler()
        }
    }
    
    func uploadImage(image: UIImage, compleationHandler: @escaping (String?) -> Void) {
        themeRepository.uploadImage(image: image) { path in
            compleationHandler(path)
        }
    }
}

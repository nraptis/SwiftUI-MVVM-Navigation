//
//  SectionContainerViewModel.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

class SectionContainerViewModel: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    
    init() {
        print("SectionContainerViewModel => init()")
    }
    
    deinit {
        print("SectionContainerViewModel => deinit()")
    }
    
    lazy var page1ViewModel: Page1ViewModel = {
        Page1ViewModel(sectionContainerViewModel: self)
    }()
}

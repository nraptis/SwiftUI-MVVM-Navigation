//
//  ContainerViewModel.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

class ContainerViewModel: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    
    init() {
        print("container vm => created()")
    }
    
    deinit {
        print("container vm => destroyed()")
    }
    
    lazy var firstPageViewModel = {
        FirstPageViewModel(container: self)
    }()
    
}

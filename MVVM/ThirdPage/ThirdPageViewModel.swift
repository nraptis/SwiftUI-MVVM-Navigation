//
//  ThirdPageViewModel.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/16/22.
//

import SwiftUI

class ThirdPageViewModel: ObservableObject {
    
    let container: ContainerViewModel
    let parent: SecondPageViewModel
    let data: SecondPageModel
    
    init(container: ContainerViewModel,
         parent: SecondPageViewModel,
         data: SecondPageModel) {
        self.container = container
        self.parent = parent
        self.data = data
        print("3rd page vm => created()")
    }
    
    deinit {
        print("3rd page vm => destroyed()")
    }
    
    func dismiss() {
        container.navigationPath.removeLast()
        parent.thirdPageViewModelDispose()
    }
}

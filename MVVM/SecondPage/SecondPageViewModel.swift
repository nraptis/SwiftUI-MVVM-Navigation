//
//  SecondPageViewModel.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct SecondPageModel: Identifiable, Hashable {
    let id: Int
}

class SecondPageViewModel: ObservableObject {
    
    @Published var models = [SecondPageModel]()
    @Published var isLoading = false
    
    let container: ContainerViewModel
    let parent: FirstPageViewModel
    let data: FirstPageModel
    
    init(container: ContainerViewModel,
         parent: FirstPageViewModel,
         data: FirstPageModel) {
        self.container = container
        self.parent = parent
        self.data = data
        print("2nd page vm => created()")
        for i in 0..<12 {
            let newModel = SecondPageModel(id: i)
            models.append(newModel)
        }
    }
    
    deinit {
        print("2nd page vm => destroyed()")
    }
    
    func selectModelIntent(model: SecondPageModel) async {
        await MainActor.run {
            isLoading = true
        }
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            
        }
        
        await MainActor.run {
            isLoading = false
            navigateToThirdPage(model: model)
        }
    }
    
    private(set) var thirdPageViewModel: ThirdPageViewModel?
    func thirdPageViewModelSpawn(model: SecondPageModel) {
        thirdPageViewModel = ThirdPageViewModel(container: container,
                                                parent: self,
                                                data: model)
    }
    
    func thirdPageViewModelDispose() {
        thirdPageViewModel = nil
    }
    
    func navigateToThirdPage(model: SecondPageModel) {
        thirdPageViewModelSpawn(model: model)
        container.navigationPath.append(model)
    }
    
    func dismiss() {
        container.navigationPath.removeLast()
        parent.secondPageViewModelDispose()
    }
}

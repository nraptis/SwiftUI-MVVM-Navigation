//
//  FirstPageViewModel.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct FirstPageModel: Identifiable, Hashable {
    let id: Int
}

class FirstPageViewModel: ObservableObject {
    
    @Published var models = [FirstPageModel]()
    @Published var isLoading = false
    
    let container: ContainerViewModel
    init(container: ContainerViewModel) {
        print("1st page vm => created()")
        self.container = container
        for i in 0..<10 {
            let newModel = FirstPageModel(id: i)
            models.append(newModel)
        }
    }
    
    deinit {
        print("1st page vm => destroyed()")
    }
    
    func selectModelIntent(model: FirstPageModel) async {
        await MainActor.run {
            isLoading = true
        }
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        } catch {
            
        }
        
        await MainActor.run {
            isLoading = false
            navigateToSecondPage(model: model)
        }
    }
    
    func navigateToSecondPage(model: FirstPageModel) {
        secondPageViewModelSpawn(model: model)
        container.navigationPath.append(model)
    }
    
    private(set) var secondPageViewModel: SecondPageViewModel?
    func secondPageViewModelSpawn(model: FirstPageModel) {
        secondPageViewModel = SecondPageViewModel(container: container,
                                                  parent: self,
                                                  data: model)
    }
    
    func secondPageViewModelDispose() {
        secondPageViewModel = nil
    }
    
}

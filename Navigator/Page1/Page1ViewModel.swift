//
//  Page1ViewModel.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

class Page1ViewModel: ObservableObject {
    
    @Published var items = [Page1Model]()
    @Published var isLoading = false
    
    let sectionContainerViewModel: SectionContainerViewModel
    
    init(sectionContainerViewModel: SectionContainerViewModel) {
        print("Page1ViewModel => init()")
        
        self.sectionContainerViewModel = sectionContainerViewModel
        for i in 0..<18 {
            items.append(Page1Model(id: i))
        }
    }
    
    deinit {
        print("Page1ViewModel => deinit()")
    }
    
    private var _page2ViewModel: Page2ViewModel?
    func page2ViewModelSpawn(_ model: Page1Model) {
        _page2ViewModel = Page2ViewModel(sectionContainerViewModel: sectionContainerViewModel,
                                         page1ViewModel: self,
                                         page1Model: model)
    }
    
    func page2ViewModelDispose() {
        _page2ViewModel = nil
    }
    
    func page2ViewModel() -> Page2ViewModel? {
        return _page2ViewModel
    }
    
    func asynchronousTask(_ model: Page1Model) async {
        
        await MainActor.run {
            self.isLoading = true
        }
        
        do {
            try await Task.sleep(nanoseconds: 500_000_000)
        } catch {
            print("Error Occurred on AsynchronousTask")
        }
        
        await MainActor.run {
            isLoading = false
            page2ViewModelSpawn(model)
            sectionContainerViewModel.navigationPath.append(model)
        }
    }
}

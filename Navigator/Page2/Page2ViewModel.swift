//
//  Page2ViewModel.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

class Page2ViewModel: ObservableObject {
    
    @Published var items = [Page2Model]()
    @Published var isLoading = false
    
    let page1Model: Page1Model
    let page1ViewModel: Page1ViewModel
    let sectionContainerViewModel: SectionContainerViewModel
    
    init(sectionContainerViewModel: SectionContainerViewModel,
         page1ViewModel: Page1ViewModel,
         page1Model: Page1Model) {
        print("Page2ViewModel => init()")
        
        self.page1Model = page1Model
        self.page1ViewModel = page1ViewModel
        self.sectionContainerViewModel = sectionContainerViewModel
        for i in 0..<18 {
            items.append(Page2Model(id: i))
        }
    }
    
    deinit {
        print("Page2ViewModel => deinit()")
    }
    
    private var _page3ViewModel: Page3ViewModel?
    func page3ViewModelSpawn(_ model: Page2Model) {
        _page3ViewModel = Page3ViewModel(sectionContainerViewModel: sectionContainerViewModel,
                                         page2ViewModel: self,
                                         page2Model: model)
    }
    
    func page3ViewModelDispose() {
        _page3ViewModel = nil
    }
    
    func page3ViewModel() -> Page3ViewModel? {
        return _page3ViewModel
    }
    
    func asynchronousTask(_ model: Page2Model) async {
        
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
            page3ViewModelSpawn(model)
            sectionContainerViewModel.navigationPath.append(model)
        }
    }
    
    func handleDismiss() {
        page1ViewModel.page2ViewModelDispose()
    }
    
}

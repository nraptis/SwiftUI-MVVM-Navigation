//
//  Page3ViewModel.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

class Page3ViewModel: ObservableObject {
    
    
    let page2Model: Page2Model
    let page2ViewModel: Page2ViewModel
    let sectionContainerViewModel: SectionContainerViewModel
    
    init(sectionContainerViewModel: SectionContainerViewModel,
         page2ViewModel: Page2ViewModel,
         page2Model: Page2Model) {
        print("Page3ViewModel => init()")
        
        self.page2Model = page2Model
        self.page2ViewModel = page2ViewModel
        self.sectionContainerViewModel = sectionContainerViewModel
    }
    
    deinit {
        print("Page3ViewModel => deinit()")
    }
    
    func handleDismiss() {
        page2ViewModel.page3ViewModelDispose()
    }
    
}

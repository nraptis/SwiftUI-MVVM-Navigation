//
//  SectionContainerView.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

struct SectionContainerView: View {
    
    @StateObject var sectionContainerViewModel = SectionContainerViewModel()
    
    var body: some View {
        NavigationStack(path: $sectionContainerViewModel.navigationPath) {
            Page1View(viewModel: sectionContainerViewModel.page1ViewModel)
        }
    }
    
}


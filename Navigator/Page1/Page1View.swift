//
//  Page1View.swift
//  ArchitectureNavigation
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

struct Page1View: View {
    
    @ObservedObject var viewModel: Page1ViewModel
    
    var body: some View {
        VStack {
            ReusableViews.titleCell(withText: "MVVM Navigation", andSubtext: "Home Page")
            List(viewModel.items) { model in
                Button {
                    Task {
                        await viewModel.asynchronousTask(model)
                    }
                } label: {
                    ReusableViews.nextCell(withText: "Item: \(model.id)", textColor: .white, backgrounColor: .black)
                }
            }
        }
        .overlay(ReusableViews.loadingOverlay(isLoading: viewModel.isLoading))
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: Page1Model.self) { [weak viewModel] hashable in
            if let page2ViewModel = viewModel?.page2ViewModel() {
                Page2View(viewModel: page2ViewModel)
            }
        }
    }
}

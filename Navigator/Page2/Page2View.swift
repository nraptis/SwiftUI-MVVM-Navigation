//
//  Page2View.swift
//  ArchitectureNavigation
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

struct Page2View: View {
    
    @ObservedObject var viewModel: Page2ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            ReusableViews.titleCell(withText: "Page 2", andSubtext: "From \(viewModel.page1Model.id)") {
                viewModel.handleDismiss()
                presentationMode.wrappedValue.dismiss()
            }
            
            List(viewModel.items) { model in
                Button {
                    Task {
                        await viewModel.asynchronousTask(model)
                    }
                    
                } label: {
                    ReusableViews.nextCell(withText: "Item: \(model.id)", textColor: .blue, backgrounColor: .yellow)
                }
            }
        }
        .overlay(ReusableViews.loadingOverlay(isLoading: viewModel.isLoading))
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: Page2Model.self) { [weak viewModel] hashable in
            if let page3ViewModel = viewModel?.page3ViewModel() {
                Page3View(viewModel: page3ViewModel)
            }
        }
        
    }
}

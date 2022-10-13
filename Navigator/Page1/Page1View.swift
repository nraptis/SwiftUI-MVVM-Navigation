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
            List(viewModel.items) { model in
                Button {
                    Task {
                        await viewModel.asynchronousTask(model)
                    }
                } label: {
                    cell(model)
                }
            }
        }
        .overlay(loadingOverlay())
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(for: Page1Model.self) { [weak viewModel] hashable in
            if let page2ViewModel = viewModel?.page2ViewModel() {
                Page2View(viewModel: page2ViewModel)
            }
        }
    }
    
    @ViewBuilder
    func loadingOverlay() -> some View {
        if viewModel.isLoading {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    Spacer()
                }
                Spacer()
            }
            .background(Color.black.opacity(0.7))
        }
    }
    
    func cell(_ model: Page1Model) -> some View {
        HStack {
            Spacer()
            
            Text("Row: \(model.id)")
                .font(.system(size: 44).bold())
                .foregroundColor(.white)
                .padding(.vertical, 8)
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.black))
    }
}

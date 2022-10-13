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
            Button {
                viewModel.handleDismiss()
                presentationMode.wrappedValue.dismiss()
            } label: {
                buttonContent("Back")
            }
            
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
        .navigationDestination(for: Page2Model.self) { [weak viewModel] hashable in
            if let page3ViewModel = viewModel?.page3ViewModel() {
                Page3View(viewModel: page3ViewModel)
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
    
    func buttonContent(_ text: String) -> some View {
        HStack {
            Spacer()
            Text("\(text)")
                .font(.system(size: 44).bold())
                .foregroundColor(.white)
                .padding(.vertical, 8)
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.black))
        .padding(.horizontal, 24)
    }
    
    func cell(_ model: Page2Model) -> some View {
        HStack {
            Spacer()
            
            Text("Row: \(model.id)")
                .font(.system(size: 44).bold())
                .foregroundColor(.white)
                .padding(.vertical, 8)
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.blue))
    }
    
}

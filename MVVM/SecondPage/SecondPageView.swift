//
//  SecondPageView.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct SecondPageView: View {
    @ObservedObject var viewModel: SecondPageViewModel
    var body: some View {
        VStack(spacing: 0) {
            ReusableViews.titleBar(withText: "Second Page", andSubtext: "Source: \(viewModel.data.id)") {
                viewModel.dismiss()
            }
            ScrollView {
                ForEach(viewModel.models) { model in
                    Button {
                        Task {
                            await viewModel.selectModelIntent(model: model)
                        }
                    } label: {
                        ReusableViews.nextCell(withText: "Item #\(model.id)", textColor: .yellow, backgrounColor: .black)
                    }
                }
                .padding(.top, 24)
                .padding(.bottom, 90)
            }
            ReusableViews.footerBar()
        }
        .toolbar(.hidden, for: .navigationBar)
        .overlay(ReusableViews.loadingOverlay(isLoading: viewModel.isLoading))
        .navigationDestination(for: SecondPageModel.self) { [weak viewModel] model in
            if let thirdPageViewModel = viewModel?.thirdPageViewModel {
                ThirdPageView(viewModel: thirdPageViewModel)
            }
        }
    }
}

//
//  FirstPageView.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct FirstPageView: View {
    
    @ObservedObject var viewModel: FirstPageViewModel
    var body: some View {
        VStack(spacing: 0) {
            ReusableViews.titleBar(withText: "First Page", andSubtext: "MVVM Architecture")
            ScrollView {
                ForEach(viewModel.models) { model in
                    Button {
                        Task {
                            await viewModel.selectModelIntent(model: model)
                        }
                    } label: {
                        ReusableViews.nextCell(withText: "Item #\(model.id)", textColor: .white, backgrounColor: .black)
                    }
                }
                .padding(.top, 24)
                .padding(.bottom, 90)
            }
            ReusableViews.footerBar()
        }
        .overlay(ReusableViews.loadingOverlay(isLoading: viewModel.isLoading))
        .navigationDestination(for: FirstPageModel.self) { [weak viewModel] model in
            if let secondPageViewModel = viewModel?.secondPageViewModel {
                SecondPageView(viewModel: secondPageViewModel)
            }
        }
    }
}

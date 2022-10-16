//
//  ContainerView.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct ContainerView: View {
    @StateObject var viewModel = ContainerViewModel()
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            FirstPageView(viewModel: viewModel.firstPageViewModel)
        }
    }
}

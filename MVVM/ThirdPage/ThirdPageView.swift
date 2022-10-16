//
//  ThirdPageView.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/15/22.
//

import SwiftUI

struct ThirdPageView: View {
    @ObservedObject var viewModel: ThirdPageViewModel
    var body: some View {
        VStack(spacing: 0) {
            ReusableViews.titleBar(withText: "Third Page", andSubtext: "Source: \(viewModel.data.id)") {
                viewModel.dismiss()
            }
            ReusableViews.trophyFiller()
            ReusableViews.footerBar()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

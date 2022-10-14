//
//  Page3View.swift
//  ArchitectureNavigation
//
//  Created by Nicky Taylor on 10/13/22.
//

import SwiftUI

struct Page3View: View {
    
    @ObservedObject var viewModel: Page3ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            
            ReusableViews.titleCell(withText: "Page 3", andSubtext: "From \(viewModel.page2Model.id)") {
                viewModel.handleDismiss()
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

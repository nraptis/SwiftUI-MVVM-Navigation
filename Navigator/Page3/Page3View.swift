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
            Button {
                viewModel.handleDismiss()
                presentationMode.wrappedValue.dismiss()
            } label: {
                buttonContent("Back")
            }
            Spacer()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func buttonContent(_ text: String) -> some View {
        HStack {
            Spacer()
            Text("\(text)")
                .font(.system(size: 50).bold())
                .foregroundColor(.white)
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.black))
    }
    
}

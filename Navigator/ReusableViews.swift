//
//  ReusableViews.swift
//  Navigator
//
//  Created by Nicky Taylor on 10/14/22.
//

import SwiftUI

class ReusableViews {
    
    static func titleCell(withText text: String, andSubtext subtext: String, backButtonHandler: (() -> Void)? = nil) -> some View {
        
        VStack(spacing: 0) {
            HStack {
                ZStack {
                    if let handler = backButtonHandler {
                        Button {
                            handler()
                        } label: {
                            Image(systemName: "arrow.left.circle")
                                .foregroundColor(.white)
                                .font(.system(size: 44))
                        }
                    }
                }
                .frame(width: 44, height: 44)
                
                Spacer()
                VStack {
                    Text(text)
                        .font(.system(size: 32).bold())
                    Text(subtext)
                        .font(.system(size: 22).bold())
                }
                .foregroundColor(.white)
                Spacer()
                
                ZStack {
                    
                }
                .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.gray)
            HStack {
                Spacer()
            }
            .frame(height: 2.0)
            .background(Color.black)
        }
        .listRowInsets(EdgeInsets())
    }
    
    static func nextCell(withText text: String, textColor: Color, backgrounColor: Color) -> some View {
        HStack {
            Text(text)
                .foregroundColor(textColor)
                .font(.system(size: 36))
            Spacer()
            Image(systemName: "arrow.right")
                .foregroundColor(textColor)
                .font(.system(size: 36))
                .padding(.all, 8)
        }
        .padding(.vertical, 8)
        .padding(.leading, 32)
        .padding(.trailing, 12)
        .background(Capsule().fill(backgrounColor))
        .listRowInsets(EdgeInsets())
    }
    
    @ViewBuilder
    static func loadingOverlay(isLoading: Bool) -> some View {
        if isLoading {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                            .scaleEffect(CGSize(width: 2.0, height: 2.0))
                            .padding(.all, 32)
                    }
                    .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.white.opacity(0.85)))
                    Spacer()
                }
                Spacer()
            }
            .background(Color.black.opacity(0.85))
        }
    }
    
}

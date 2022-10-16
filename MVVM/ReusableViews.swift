//
//  ReusableViews.swift
//  MVVM
//
//  Created by Nicky Taylor on 10/14/22.
//

import SwiftUI

class ReusableViews {
    
    static func titleBar(withText text: String, andSubtext subtext: String, backButtonHandler: (() -> Void)? = nil) -> some View {
        VStack(spacing: 0) {
            HStack {
                ZStack {
                    if let handler = backButtonHandler {
                        Button {
                            handler()
                        } label: {
                            Image(systemName: "arrow.left.circle")
                                
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
                .padding(.bottom, 6)
                Spacer()
                Spacer()
                    .frame(width: 44)
            }
            .foregroundColor(.black)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.55, green: 0.85, blue: 0.90), Color(red: 0.75, green: 0.75, blue: 0.82)]), startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 1, y: 0.5)))
            horizontalLine()
        }
        .foregroundColor(.white)
    }
    
    static func footerBar() -> some View {
        VStack(spacing: 0) {
            horizontalLine()
            HStack {
                Spacer()
                Image(systemName: "heart.circle")
                    .font(.system(size: 44))
                    .padding(.all, 6)
                Spacer()
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.75, green: 0.75, blue: 0.82), Color(red: 0.55, green: 0.85, blue: 0.90)]), startPoint: UnitPoint(x: 0, y: 0.5), endPoint: UnitPoint(x: 1, y: 0.5)))
        }
        .foregroundColor(.black)
    }
    
    static func nextCell(withText text: String, textColor: Color, backgrounColor: Color) -> some View {
        HStack {
            Text(text)
                .foregroundColor(textColor)
                .font(.system(size: 36))
                .padding(.all, 16)
                .padding(.leading, 12)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(textColor)
                .font(.system(size: 36))
                .padding(.all, 8)
                .padding(.trailing, 8)
        }
        .background(Capsule().fill(backgrounColor))
        .padding(.horizontal, 24)
        .padding(.vertical, 6)
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
    
    static func trophyFiller() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    ZStack {
                        
                    }
                    .frame(width: 184, height: 184)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.26, green: 0.26, blue: 0.26), Color(red: 0.36, green: 0.36, blue: 0.36)]), startPoint: UnitPoint(x: 0.0, y: 0.5), endPoint: UnitPoint(x: 1.0, y: 0.5)))
                    .clipShape(Circle())
                    
                    ZStack {
                        
                    }
                    .frame(width: 180, height: 180)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.46, green: 0.46, blue: 0.46), Color(red: 0.57, green: 0.57, blue: 0.57)]), startPoint: UnitPoint(x: 0.5, y: 0.0), endPoint: UnitPoint(x: 0.5, y: 1.0)))
                    .clipShape(Circle())
                    
                    Image(systemName: "trophy.fill")
                        .font(.system(size: 110))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            Spacer()
        }
        .background(Color(red: 0.24, green: 0.24, blue: 0.24))
    }
    
    private static func horizontalLine() -> some View {
        HStack {
            Spacer()
        }
        .frame(height: 2.0)
        .background(Color.black)
    }
}

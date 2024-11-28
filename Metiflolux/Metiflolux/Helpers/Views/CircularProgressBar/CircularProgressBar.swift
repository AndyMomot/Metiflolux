//
//  CircularProgressBar.swift
//  Libarorent
//
//

import SwiftUI

struct CircularProgressBar: View {
    var progress: Double
    
    var backgroundLineColor: Color = .black
    var progressLineColors: Color = .red
    var lineWidth: CGFloat = 18
    var lineCap: CGLineCap = .butt
    
    var title: String?
    var titleColor: Color = .blue
    
    var progressColor: Color = .blue
    var font: SwiftUI.Font?
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    backgroundLineColor,
                    lineWidth: lineWidth
                )
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    progressLineColors,
                    style: .init(
                        lineWidth: lineWidth,
                        lineCap: lineCap
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            
            VStack(spacing: 5) {
                if let title {
                    Text(title)
                        .foregroundStyle(titleColor)
                        .font(font)
                        .lineLimit(2)
                        .minimumScaleFactor(0.6)
                }
                
                Text((progress * 100).string() + "%")
                    .foregroundStyle(progressColor)
                    .font(font)
                    .lineLimit(2)
                    .minimumScaleFactor(0.6)
            }
        }
    }
}

#Preview {
    CircularProgressBar(progress: 0.2)
        .padding()
}

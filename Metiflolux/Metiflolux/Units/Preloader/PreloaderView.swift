//
//  PreloaderView.swift
//  Libarorent
//
//  Created by Andrii Momot on 06.10.2024.
//

import SwiftUI
import Combine

struct PreloaderView: View {
    @State private var timer: Timer?
    @State var progress = 0
    
    private let maxValue = 8
    let onDidLoad = PassthroughSubject<Void, Never>()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preLoaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Asset.preLoaderLogo.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 70)
                
                VStack(spacing: 8) {
                    DashedProgressBar(
                        progress: $progress,
                        maxValue: maxValue,
                        backgroundColor: .white,
                        foregroundColor: Colors.dipBlue.swiftUIColor)
                    .frame(height: 11)
                    
                    Text("Ładowanie")
                        .foregroundStyle(.white)
                        .font(Fonts.Inter.regular.swiftUIFont(size: 15))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 76)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            startLoading()
        }
    }
}

private extension PreloaderView {
    func startLoading() {
        timer?.invalidate()
        timer = nil
        
        timer = .scheduledTimer(withTimeInterval: 0.3,
                                repeats: true, block: { timer in
            let newValue = progress + 1
            updateProgress(value: newValue,
                           maxValue: self.maxValue)
            notifyWhenDidLoad()
            
            if newValue >= maxValue {
                timer.invalidate()
            }
        })
    }
    
    func updateProgress(value: Int, maxValue: Int) {
        withAnimation(.easeInOut(duration: 0.3)) {
            if value >= maxValue {
                progress = maxValue
            } else {
                progress = value
            }
        }
    }
    
    func notifyWhenDidLoad() {
        if progress >= maxValue {
            onDidLoad.send()
        }
    }
}

#Preview {
    PreloaderView()
}

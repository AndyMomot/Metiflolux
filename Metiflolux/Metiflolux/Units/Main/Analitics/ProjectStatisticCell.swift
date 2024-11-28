//
//  ProjectStatisticCell.swift
//  Metiflolux
//
//

import SwiftUI

struct ProjectStatisticCell: View {
    var project: ProjectModel
    @State var image: Image?
    @State var profit: Double = .zero
    @State var costs: Double = .zero
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: .zero) {
            if let image {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: bounds.width * 0.3,
                        height: bounds.width * 0.3
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Asset.placeholder.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: bounds.width * 0.3)
            }
            
            Spacer(minLength: 16)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(project.title)
                    .foregroundStyle(Colors.graphit.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                
                HStack {
                    Spacer()
                    CircularProgressBar(
                        progress: profit,
                        backgroundLineColor: .white,
                        progressLineColors: Colors.liteGreen.swiftUIColor,
                        lineWidth: 3,
                        title: "Zysk",
                        titleColor: Colors.liteGreen.swiftUIColor,
                        progressColor: .white,
                        font: Fonts.Inter.bold.swiftUIFont(size: 10)
                    )
                    .frame(width: bounds.width * 0.135)
                    Spacer()
                    CircularProgressBar(
                        progress: costs,
                        backgroundLineColor: .white,
                        progressLineColors: Colors.liteOrange.swiftUIColor,
                        lineWidth: 3,
                        title: "Koszty",
                        titleColor: Colors.liteOrange.swiftUIColor,
                        progressColor: .white,
                        font: Fonts.Inter.bold.swiftUIFont(size: 10)
                    )
                    .frame(width: bounds.width * 0.135)
                    Spacer()
                }
                .padding(.vertical)
                .background(Colors.graphit.swiftUIColor)
                .cornerRadius(10, corners: .allCorners)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(17, corners: .allCorners)
        .shadow(radius: 5, y: 5)
        .onAppear {
            DispatchQueue.main.async {
                Task {
                    image = await setImage()
                }
            }
            
            setProgress()
        }
    }
}

private extension ProjectStatisticCell {
    func setImage() async -> Image? {
        let iSManager = ImageStorageManager()
        
        guard let data = await iSManager.fetchImage(with: project.id),
        let uiImage = UIImage(data: data)
        else {
            return nil
        }
        return .init(uiImage: uiImage)
    }
    
    func setProgress() {
        DispatchQueue.main.async {
            let maxValue = Double(project.mainBudget)
            profit = Double(project.earnings) / maxValue
            costs = Double(project.costs) / maxValue
        }
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        ProjectStatisticCell(
            project: .init(
                title: "Salon Kwiatowy Kraków",
                mainBudget: 100,
                flowersBudget: 5,
                salariesBudget: 10,
                renovationBudget: 15,
                rentingBudget: 25
            )
        )
        .padding()
    }
}

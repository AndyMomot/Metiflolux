//
//  ProjectStatisticListView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 22.10.2024.
//

import SwiftUI

struct ProjectStatisticListView: View {
    var projects: [ProjectModel]
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 20) {
                Text("Analizy moich projektów")
                    .foregroundStyle(.white)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 30))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                
                HStack {
                    Rectangle()
                        .foregroundStyle(Colors.liteGreen.swiftUIColor)
                        .frame(width: bounds.width * 0.3, height: 6)
                    Spacer()
                    Rectangle()
                        .foregroundStyle(Colors.liteOrange.swiftUIColor)
                        .frame(width: bounds.width * 0.3, height: 6)
                }
            }
            
            VStack(spacing: 25) {
                ForEach(projects) { project in
                    ProjectStatisticCell(project: project)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        ScrollView {
            ProjectStatisticListView(projects: [
                .init(
                    title: "Salon Kwiatowy Kraków",
                    mainBudget: 100,
                    flowersBudget: 5,
                    salariesBudget: 10,
                    renovationBudget: 15,
                    rentingBudget: 25
                ),
                .init(
                    title: "Salon Kwiatowy Kraków",
                    mainBudget: 100,
                    flowersBudget: 15,
                    salariesBudget: 12,
                    renovationBudget: 17,
                    rentingBudget: 25
                )
            ])
                .padding(.horizontal)
        }
    }
}

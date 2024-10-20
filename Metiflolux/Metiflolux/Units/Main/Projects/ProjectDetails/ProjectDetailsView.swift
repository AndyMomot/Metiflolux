//
//  ProjectDetailsView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 20.10.2024.
//

import SwiftUI

struct ProjectDetailsView: View {
    var project: ProjectModel
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Asset.projectDetailsBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                BackButton(title: "Powrót")
                    .padding(.horizontal)
                
                ScrollView {
                    Text(project.title)
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    ProjectDetailsView(project: .init(
        title: "Salon Kwiatowy Kraków",
        mainBudget: 1000))
}

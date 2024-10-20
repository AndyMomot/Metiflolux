//
//  MyProjectsView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 20.10.2024.
//

import SwiftUI

struct MyProjectsView: View {
    var projects: [ProjectModel]
    var action: (ViewAction) -> Void
    
    var body: some View {
        if projects.isEmpty {
            NoProjectsView()
                .padding(.horizontal)
                .onTapGesture {
                    action(.onCreate)
                }
        } else {
            VStack(spacing: .zero) {
                Text("Moje projekty")
                    .foregroundStyle(.white)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 30))
                
                Spacer(minLength: 30)
                
                ProjectsCarouselView(
                    projects: projects) { project in
                        action(.onProject(project))
                    }
            }
            .frame(height: UIScreen.main.bounds.height * 0.4)
        }
    }
}

extension MyProjectsView {
    enum ViewAction {
        case onProject(ProjectModel)
        case onCreate
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        VStack {
            MyProjectsView(
                projects: []) { _ in }
            
            Rectangle()
                .frame(height: 5)
                .padding(.horizontal)
            
            MyProjectsView(
                projects: [
                    .init(title: "Test 1", mainBudget: 100),
                    .init(title: "Test 2", mainBudget: 100),
                    .init(title: "Test 3", mainBudget: 100),
                    .init(title: "Test 4", mainBudget: 100),
            ]) { _ in }
        }
    }
}

//
//  ProjectsCarouselView.swift
//  Metiflolux
//
//

import SwiftUI

struct ProjectsCarouselView: View {
    var projects: [ProjectModel]
    var action: (ProjectModel) -> Void
    
    @State private var selectedIndex = 0
    
    var body: some View {
        let range = (0..<projects.count)
        VStack(spacing: .zero) {
            GeometryReader { reader in
                ProjectsSnapperView(size: reader.size, projects: projects) { index in
                    withAnimation {
                        self.selectedIndex = index
                    }
                } action: { project in
                    action(project)
                }
            }
            
            Spacer(minLength: 20)
            
            HStack(spacing: 8) {
                ForEach(range, id: \.self) { index in
                    let isSelected = selectedIndex == index
                    Circle()
                        .foregroundStyle(
                            isSelected ? Colors.dipBlue.swiftUIColor : Colors.graphit.swiftUIColor
                        )
                        .frame(width: 8)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 9)
            .background(.white)
            .cornerRadius(10, corners: .allCorners)
        }
    }
}

#Preview {
    ProjectsCarouselView(projects: [
        .init(title: "Test 1", mainBudget: 100),
        .init(title: "Test 2", mainBudget: 100),
        .init(title: "Test 3", mainBudget: 100),
        .init(title: "Test 4", mainBudget: 100),
    ]) { _ in
        
    }
    .frame(height: 300)
}

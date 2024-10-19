//
//  ProjectsCarouselView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 19.10.2024.
//

import SwiftUI

struct ProjectsCarouselView: View {
    var projects: [ProjectModel]
    var onSelect: (Int) -> Void
    var action: (ProjectModel) -> Void
    
    @State private var selectedIndex = 0
    
    var body: some View {
        let range = (0..<projects.count)
        
        VStack(spacing: 16) {
            GeometryReader { reader in
                ProjectsSnapperView(size: reader.size, projects: projects) { index in
                    onSelect(index)
                    withAnimation {
                        self.selectedIndex = index
                    }
                } action: { project in
                    action(project)
                }
            }
            
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
        
    } action: { _ in
        
    }
}

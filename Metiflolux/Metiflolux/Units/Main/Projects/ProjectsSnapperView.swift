//
//  ProjectsSnapperView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 19.10.2024.
//

import SwiftUI

struct ProjectsSnapperView: View {
    let size: CGSize
    let projects: [ProjectModel]
    
    var onSelect: (Int) -> Void
    var action: (ProjectModel) -> Void
    
    private let padding: CGFloat
    private let cardWidth: CGFloat
    private let spacing: CGFloat = 15.0
    private let maxSwipeDistance: CGFloat
    
    @State private var selectedIndex: Int = 1
    @State private var isDragging: Bool = false
    @State private var totalDrag: CGFloat = 0.0
    
    init(size: CGSize,
         projects: [ProjectModel],
         onSelect: @escaping (Int) -> Void,
         action: @escaping (ProjectModel) -> Void) {
        self.size = size
        self.projects = projects
        self.onSelect = onSelect
        self.action = action
        self.cardWidth = size.width * 0.8
        self.padding = (size.width - cardWidth) / 2.0
        self.maxSwipeDistance = cardWidth + spacing
    }
    
    var body: some View {
        let offset: CGFloat = maxSwipeDistance - (maxSwipeDistance * CGFloat(selectedIndex))
        LazyHStack(spacing: spacing) {
            let range = (0..<projects.count)
            ForEach(range, id: \.self) { index in
                let project = projects[index]
                let isSelected = index == (self.selectedIndex - 1)

                HStack {
                    Spacer()
                    Text(project.title)
                        .offset(x: isDragging ? totalDrag : 0)
                        .animation(.snappy(duration: 0.4, extraBounce: 0.2), value: isDragging)
                        .onTapGesture {
                            action(project)
                        }
                    Spacer()
                }
                .frame(width: cardWidth)
                .background(.blue)
            }
        }
        .padding(.horizontal, padding)
        .offset(x: offset, y: 0)
        .gesture(
            DragGesture()
                .onChanged { value in
                    DispatchQueue.main.async {
                        withAnimation {
                            isDragging = true
                            totalDrag = value.translation.width
                        }
                    }
                }
                .onEnded { value in
                    DispatchQueue.main.async {
                        withAnimation {
                            totalDrag = 0.0
                            isDragging = false
                            
                            if (value.translation.width < -(cardWidth / 2.0) && self.selectedIndex < projects.count) {
                                self.selectedIndex = self.selectedIndex + 1
                            }
                            if (value.translation.width > (cardWidth / 2.0) && self.selectedIndex > 1) {
                                self.selectedIndex = self.selectedIndex - 1
                            }
                            
                            let selectedIndex = selectedIndex - 1
                            onSelect(selectedIndex)
                        }
                    }
                }
        )
    }
}

//
//  CommentsListView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 22.10.2024.
//

import SwiftUI

struct CommentsListView: View {
    var comments: [CommentModel]
    var action: (ViewAction) -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Uwagi")
                .foregroundStyle(.white)
                .font(Fonts.Inter.bold.swiftUIFont(size: 30))
            
            NextButton(imageName: Asset.plus.name) {
                action(.onCreate)
            }
            .frame(height: 49)
            .padding(.horizontal, bounds.width * 0.18)
            
            VStack(spacing: 10) {
                ForEach(comments) { comment in
                    CommentCell(comment: comment) {
                        action(.onDelete(id: comment.id))
                    }
                }
            }
            .padding(.horizontal, bounds.width * 0.08)
        }
    }
}

extension CommentsListView {
    enum ViewAction {
        case onCreate
        case onDelete(id: String)
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        ScrollView {
            CommentsListView(comments: []) {_ in}
        }
    }
}

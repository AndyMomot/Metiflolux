//
//  CommentCell.swift
//  Metiflolux
//
//

import SwiftUI

struct CommentCell: View {
    var comment: CommentModel
    var onDelete: () -> Void
    
    @State private var image: Image?
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: .zero) {
            VStack {
                if let image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: bounds.width * 0.28,
                            height: bounds.width * 0.35
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Asset.placeholder.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: bounds.width * 0.28)
                }
            }
            
            Spacer(minLength: 18)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Button {
                        onDelete()
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.black)
                            .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                    }
                    .frame(width: 24, height: 24)
                }
                
                Text(comment.name)
                    .foregroundStyle(Colors.graphit.swiftUIColor)
                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                
                Text(comment.note)
                    .foregroundStyle(Colors.graphit.swiftUIColor)
                    .font(Fonts.Inter.light.swiftUIFont(size: 10))
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(10, corners: .allCorners)
        .shadow(radius: 5, y: 5)
        .onAppear {
            DispatchQueue.main.async {
                Task {
                    image = await setImage()
                }
            }
        }
    }
}

private extension CommentCell {
    func setImage() async -> Image? {
        let iSManager = ImageStorageManager()
        
        guard let data = await iSManager.fetchImage(with: comment.id),
        let uiImage = UIImage(data: data)
        else {
            return nil
        }
        return .init(uiImage: uiImage)
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        CommentCell(comment: .init(
            name: "Salon Kwiatowy Kraków",
            note: "to miejsce, gdzie pasja do kwiatów łączy się z elegancją i wyjątkową estetyką. Oferujemy szeroki wybór świeżych, starannie wyselekcjonowanych roślin, od klasycznych bukietów po unikalne kompozycje kwiatowe na każdą okazję."
        )) {}
        .padding()
    }
}

//
//  ProjectView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 20.10.2024.
//

import SwiftUI

struct ProjectView: View {
    var item: ProjectModel
    var width: CGFloat
    var isSelected: Bool
    
    @State private var image: Image?
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                VStack(alignment: .leading, spacing: 9) {
                    HStack {
                        Spacer()
                        
                        if let image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: bounds.width * 0.35,
                                    height: bounds.width * 0.35
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } else {
                            Asset.placeholder.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: bounds.width * 0.35,
                                    height: bounds.width * 0.35
                                )
                        }
                        
                        Spacer()
                    }
                    
                    Text(item.title)
                        .foregroundStyle(Colors.slateGray.swiftUIColor)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                        .minimumScaleFactor(0.8)
                }
                .padding(.top, 15)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        Asset.share.swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 27)
                            .background(Colors.dipBlue.swiftUIColor)
                        .cornerRadius(12, corners: .topLeft)
                    }
                }
            }
        }
        .frame(width: width)
        .cornerRadius(17, corners: .allCorners)
        .shadow(radius: 4, y: 4)
        .onAppear {
            DispatchQueue.main.async {
                Task {
                    image = await getImage(with: item.id)
                }
            }
        }
    }
}

private extension ProjectView {
    func getImage(with id: String) async -> Image? {
        guard let data = await ImageStorageManager().fetchImage(with: id),
              let image = UIImage(data: data)
        else {
            return nil
        }
        
        return .init(uiImage: image)
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        ProjectView(
            item: .init(title: "Salon Kwiatowy Kraków",
                        mainBudget: 1000),
            width: 195,
            isSelected: true)
        .frame(height: 233)
    }
}

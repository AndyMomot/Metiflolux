//
//  CreateCommentView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 21.10.2024.
//

import SwiftUI

struct CreateCommentView: View {
    @StateObject private var viewModel = ViewModel()
    var onCreate: () -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: 50) {
            VStack(spacing: 17) {
                HStack(alignment: .bottom, spacing: 15) {
                    // Image view
                    Button {
                        viewModel.showImagePicker.toggle()
                    } label: {
                        if viewModel.image == UIImage() {
                            Asset.placeholder.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: bounds.width * 0.3)
                        } else {
                            Image(uiImage: viewModel.image)
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: bounds.width * 0.3,
                                    height: bounds.width * 0.3
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    
                    // Text field
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                onCreate()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.black)
                                    .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                            }
                            .frame(width: 24, height: 24)
                        }
                        
                        InputField(
                            title: "Tytuł notatki",
                            placeholder: "Opracowanie budżetu",
                            text: $viewModel.name)
                    }
                }
                
                DynamicHeightTextField(
                    title: "Opis notatki",
                    placeholder: "Napisz informacje lub notatkę",
                    text: $viewModel.note)
                .frame(minHeight: 161)
                .hideKeyboardWhenTappedAround()
            }
            
            NextButton(imageName: Asset.plus.name, title: "Utwórz") {
                viewModel.createProject {
                    onCreate()
                }
            }
                .frame(height: 49)
                .padding(.horizontal, 37)
                .opacity(viewModel.isValidFields ? 1 : 0.5)
                .disabled(!viewModel.isValidFields)
        }
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
        .onChange(of: viewModel.image) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.name) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.note) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
    }
}

#Preview {
    ZStack {
        Asset.homeBg.swiftUIImage
            .resizable()
            .ignoresSafeArea()
        
        CreateCommentView() {}
            .padding(.horizontal)
    }
}

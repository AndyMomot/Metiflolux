//
//  CreateProjectView.swift
//  Metiflolux
//
//

import SwiftUI

struct CreateProjectView: View {
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
                    InputField(
                        title: "Określenie budżetu",
                        placeholder: "Opracowanie budżetu",
                        text: $viewModel.projectName)
                }
                
                InputField(
                    title: "Określenie budżetu na wynajem pomieszczeń",
                    placeholder: "Wprowadź informacje w tym wierszu",
                    text: $viewModel.projectBudget
                )
                .keyboardType(.numberPad)
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
        .onChange(of: viewModel.projectName) { _ in
            withAnimation {
                viewModel.validateFields()
            }
        }
        .onChange(of: viewModel.projectBudget) { _ in
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
        
        CreateProjectView {}
    }
}

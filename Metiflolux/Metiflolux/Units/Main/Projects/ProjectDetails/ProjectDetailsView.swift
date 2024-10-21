//
//  ProjectDetailsView.swift
//  Metiflolux
//
//  Created by Andrii Momot on 20.10.2024.
//

import SwiftUI

struct ProjectDetailsView: View {
    @State var project: ProjectModel
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) private var dismiss
    var onDismiss: () -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.projectDetailsBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 34) {
                // Nav. back button
                HStack {
                    BackButton(title: "Powrót")
                    
                    Button {
                        viewModel.delete(projectId: project.id) {
                            dismiss.callAsFunction()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.white)
                            .font(Fonts.Inter.bold.swiftUIFont(size: 20))
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 32) {
                        
                        // Header
                        // Image, title, balance
                        HStack(alignment: .top, spacing: .zero) {
                            if let image = viewModel.image {
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
                            
                            Spacer(minLength: 20)
                            
                            VStack(alignment: .leading) {
                                Text(project.title)
                                    .foregroundStyle(.white)
                                    .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.7)
                                
                                HStack {
                                    Spacer()
                                    Text("\(viewModel.mainBudget)")
                                        .foregroundStyle(.white)
                                        .font(Fonts.Inter.bold.swiftUIFont(size: 18))
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.7)
                                        .padding()
                                    Spacer()
                                }
                                .background(Colors.dipBlue.swiftUIColor)
                                .cornerRadius(9, corners: .allCorners)
                            }
                        }
                        
                        // Input fields
                        VStack(spacing: 8) {
                            InputField(
                                title: "Ustal budżet na zakup kwiatów",
                                text: $viewModel.flowersBudget)
                            
                            InputField(
                                title: "Ustal budżet na wynagrodzenia dla współpracowników",
                                text: $viewModel.salariesBudget)
                            
                            InputField(
                                title: "Ustal budżet na remont pokoju",
                                text: $viewModel.renovationBudget)
                            
                            InputField(
                                title: "Określenie budżetu na wynajem pomieszczeń",
                                text: $viewModel.rentingBudget)
                        }
                        
                        // Costs
                        HStack {
                            Spacer()
                            Text("Twoje koszty")
                            Spacer()
                            Rectangle()
                                .frame(width: 3)
                            Spacer()
                            Text("\(viewModel.costs)")
                            Spacer()
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 20))
                        .padding()
                        .background(Colors.liteOrange.swiftUIColor)
                        .cornerRadius(10, corners: .allCorners)
                        
                        // Info
                        HStack(spacing: 10) {
                            Asset.info.swiftUIImage
                            Text("Każdy projekt przynosi zazwyczaj 20-30% całkowitych kosztów projektu.")
                                .foregroundStyle(Colors.slateGray.swiftUIColor)
                                .font(Fonts.Inter.bold.swiftUIFont(size: 15))
                            
                            Spacer()
                        }
                        
                        // Earnings
                        HStack {
                            Spacer()
                            Text("Twoje zarobki")
                            Spacer()
                            Rectangle()
                                .frame(width: 3)
                            Spacer()
                            Text("\(viewModel.earnings)")
                            Spacer()
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.Inter.bold.swiftUIFont(size: 20))
                        .padding()
                        .background(Colors.liteGreen.swiftUIColor)
                        .cornerRadius(10, corners: .allCorners)
                        
                        // Save
                        NextButton(title: "Ratować") {
                            viewModel.save(project: project) {
                                dismiss.callAsFunction()
                            }
                        }
                        .frame(height: 48)
                    }
                    .padding(.horizontal, 40)
                }
                .scrollIndicators(.never)
            }
        }
        .onAppear {
            Task {
                await viewModel.setProject(project)
            }
        }
        .onChange(of: viewModel.flowersBudget) { _ in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.updateBudget(for: &project)
                }
            }
        }
        .onChange(of: viewModel.salariesBudget) { _ in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.updateBudget(for: &project)
                }
            }
        }
        .onChange(of: viewModel.renovationBudget) { _ in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.updateBudget(for: &project)
                }
            }
        }
        .onChange(of: viewModel.rentingBudget) { _ in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.updateBudget(for: &project)
                }
            }
        }
    }
}

#Preview {
    ProjectDetailsView(project: .init(
        title: "Salon Kwiatowy Kraków",
        mainBudget: 20000)) {}
}

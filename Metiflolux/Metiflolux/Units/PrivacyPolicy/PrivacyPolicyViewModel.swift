//
//  PrivacyPolicyViewModel.swift
//  Chainestery
//
//

import Foundation

extension PrivacyPolicyView {
    final class PrivacyPolicyViewModel: ObservableObject {
        @Published var isAgreed = false
        @Published var showPrivacyPolicy = false
        let privacyPolicyURL = URL(string: "https://metiflolux.info")
        
        func showMainFlow(rootViewModel: RootContentView.RootContentViewModel) {
            DispatchQueue.main.async {
                rootViewModel.setFlow(.main)
            }
        }
    }
}

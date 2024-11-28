//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        @Published var showPrivacyPolicy = false
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var bgImage: String {
            switch self {
            case .first:
                return Asset.onboard1.name
            case .second:
                return Asset.onboard2.name
            case .third:
                return Asset.onboard3.name
            }
        }
        
        var title: String {
            switch self {
            case .first:
                return "Identyfikacja wizualna"
            case .second:
                return "Baza kontrahentów"
            case .third:
                return "Kalkulacja finansowa"
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return "Stwórz skuteczną identyfikację wizualną dla swojej kwiaciarni dzięki naszemu szablonowi. Pomoże Ci ona wyróżnić się na rynku i podkreślić Twój wizerunek."
            case .second:
                return "Wypełnij bazę kontrahentów, w tym ogrodników i firm pakujących. Każdy będzie mógł łatwo wprowadzić swoje dane, co ułatwi nawiązywanie kontaktów biznesowych."
            case .third:
                return "Uzyskaj dokładną kalkulację kosztów franczyzy lub zakupu biznesu. Planuj promocje i wspieraj swój biznes na wszystkie dostępne sposoby!"
            }
        }
        
        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
    }
}

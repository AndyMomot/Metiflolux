//
//  FAQViewModel.swift
//  Metiflolux
//
//

import Foundation

extension FAQView {
    final class ViewModel: ObservableObject {
        @Published var selectedItem = FAQModel(
            image: Asset.faq1.name,
            title: "Analiza rynku i wybór koncepcji",
            text: "Analiza konkurencji: Zbadaj rynek, aby dowiedzieć się, kim są Twoi konkurenci, jakie usługi florystyczne oferują i jak możesz się wyróżnić. Poznanie konkurencji pomoże Ci zrozumieć, jakie nisze można wykorzystać. Określenie grupy docelowej: Zdecyduj, kto będzie Twoim głównym klientem (firmy, wesela, klienci detaliczni itp.).\n\nOkreślenie grupy docelowej ułatwi dostosowanie oferty do ich potrzeb.\n\nTworzenie koncepcji: Wybierz unikalny styl swojego sklepu (ręcznie robione bukiety, egzotyczne rośliny, kompozycje na imprezy okolicznościowe). Wyjątkowa koncepcja przyciągnie klientów i pomoże w wyróżnieniu się na rynku."
        )
        
        let faqItems: [FAQModel] = [
            .init(
                image: Asset.faq1.name,
                title: "Analiza rynku i wybór koncepcji",
                text: "Analiza konkurencji: Zbadaj rynek, aby dowiedzieć się, kim są Twoi konkurenci, jakie usługi florystyczne oferują i jak możesz się wyróżnić. Poznanie konkurencji pomoże Ci zrozumieć, jakie nisze można wykorzystać. Określenie grupy docelowej: Zdecyduj, kto będzie Twoim głównym klientem (firmy, wesela, klienci detaliczni itp.).\n\nOkreślenie grupy docelowej ułatwi dostosowanie oferty do ich potrzeb.\n\nTworzenie koncepcji: Wybierz unikalny styl swojego sklepu (ręcznie robione bukiety, egzotyczne rośliny, kompozycje na imprezy okolicznościowe). Wyjątkowa koncepcja przyciągnie klientów i pomoże w wyróżnieniu się na rynku."
            ),
            .init(
                image: Asset.faq2.name,
                title: "Wybór odpowiedniego lokalu",
                text: "Wybór lokalizacji: Lokal powinien znajdować się w miejscu o dużym natężeniu ruchu, np. w pobliżu centrów biznesowych, kompleksów handlowych lub osiedli mieszkaniowych. Lokalizacja z łatwym dostępem zapewni większy przepływ klientów.\n\nPowierzchnia i wyposażenie: Lokal musi spełniać Twoje wymagania. Powinien mieć przestrzeń do przechowywania kwiatów (lodówki), miejsce do pracy nad bukietami oraz przestrzeń do eksponowania kompozycji florystycznych.\n\nPodpisanie umowy najmu: Upewnij się, że umowa najmu jest korzystna i zapewnia odpowiedni czas na rozwój biznesu. Sprawdź, czy w umowie uwzględniono wszelkie niezbędne warunki, np. możliwość przedłużenia najmu."
            ),
            .init(
                image: Asset.faq3.name,
                title: "Zakup sprzętu i materiałów",
                text: "Sprzęt: Zakup lodówki do przechowywania kwiatów, stojaki do ekspozycji, witryny, stoły robocze oraz narzędzia florystyczne.\n\nDostawcy kwiatów i materiałów: Nawiąż relacje z zaufanymi dostawcami świeżych kwiatów, akcesoriów florystycznych oraz materiałów opakowaniowych.\n\nAutomatyzacja: Jeśli to konieczne, zainstaluj terminale POS do obsługi transakcji, system CRM do zarządzania sprzedażą oraz kontaktami z klientami. To usprawni procesy w Twoim sklepie."
            ),
            .init(
                image: Asset.faq4.name,
                title: "Licencje i marketing",
                text: "Dokumenty i pozwolenia: Zarejestruj firmę, zdobądź wymagane licencje i pozwolenia na prowadzenie działalności związanej z handlem kwiatami. Sprawdź lokalne przepisy, aby mieć pewność, że działasz zgodnie z prawem.\n\nStrategia marketingowa: Zacznij promować sklep przed jego otwarciem. Wykorzystaj media społecznościowe, uruchom reklamy i zaplanuj promocję w dniu otwarcia (np. darmowe mini-bukiety dla pierwszych klientów).\n\nOficjalne otwarcie: Zorganizuj uroczyste otwarcie z zaproszeniem klientów, partnerów i influencerów. To przyciągnie uwagę i pomoże szybko zbudować bazę klientów."
            ),
        ]
    }
}

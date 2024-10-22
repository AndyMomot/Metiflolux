import SwiftUI

struct InputField: View {
    var title: String
    var titleColor: Color = .white
    var textColor: Color = .black
    var placeholder: String = "Napisz tekst"
    @Binding var text: String
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(titleColor)
                .font(Fonts.Inter.light.swiftUIFont(size: 13))
                .padding(.horizontal)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            
            HStack {
                TextField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(Colors.silver.swiftUIColor)
                        .font(Fonts.Inter.light.swiftUIFont(size: 13))
                }
                .focused($isInputActive)
                .foregroundStyle(textColor)
                .font(Fonts.Inter.regular.swiftUIFont(size: 13))
                .padding(.leading, 16)
                .padding(.vertical, 18)
                
                Button {
                    withAnimation {
                        isInputActive.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(textColor)
                        .padding()
                }
                .hidden(!isInputActive)
            }
            .background(.white)
            .cornerRadius(20, corners: .allCorners)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
        InputField(title: "Nazwa towaru", text: .constant(""))
            .padding(.horizontal)
    }
}

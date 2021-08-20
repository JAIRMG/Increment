// TextFieldCustomRoundedStyle.swift, created on 18/08/21 by jair
	

import SwiftUI

struct TextFieldCustomRoundedStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.primary)
            .padding()
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primary)
            )
            .padding(.horizontal, 15)
    }
}

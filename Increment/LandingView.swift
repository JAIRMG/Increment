// ContentView.swift, created on 12/06/21 by jair
	

import SwiftUI

struct LandingView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: proxy.size.height * 0.18)
                Text("Increment")
                    .font(.system(size: 64, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}) {
                    HStack(spacing: 15) {
                        Spacer()
                        Image(systemName: "plus.circle")
                        Text("Create a challenge")
                        Spacer()
                    }
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                }
                .padding(.horizontal, 15)
                .buttonStyle(PrimaryButtonStyle())
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(
                Image("pullup")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Color.black.opacity(0.4))
                    .frame(width: proxy.size.width)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 11")
    }
}

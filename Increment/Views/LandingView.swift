// ContentView.swift, created on 12/06/21 by jair


import SwiftUI

struct LandingView: View {
    @StateObject private var viewModel = LandingViewModel()
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.08)
                    Text("Increment")
                        .font(.system(size: 64, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: $viewModel.createPushed) {
                        Button(action: {
                            viewModel.createPushed = true
                        }) {
                            HStack(spacing: 15) {
                                Spacer()
                                Image(systemName: "plus.circle")
                                Text("Create a challenge")
                                Spacer()
                            }
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundColor(.white)
                        }
                        .padding(15)
                        .buttonStyle(PrimaryButtonStyle())
                    }
                    NavigationLink(destination: LoginSignupView(viewModel: .init(mode: .login)),
                                   isActive: $viewModel.loginSignupPushed) {
                        Button("I already have an account") {
                            // trigger push
                            viewModel.loginSignupPushed = true
                        }.foregroundColor(.white)
                    }
                    
                }
                .padding(.bottom, 15)
                .frame(
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
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 11")
    }
}

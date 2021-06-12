// CreateView.swift, created on 12/06/21 by jair


import SwiftUI

struct CreateView: View {
    @State private var isActive = false
    var body: some View {
        ScrollView {
            VStack {
                DropdownView()
                DropdownView()
                DropdownView()
                DropdownView()
                Spacer()
                NavigationLink(
                    destination: RemindView(),
                    isActive: $isActive) {
                    Button(action: {
                        isActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 24, weight: .medium))
                    }
                }
            }
            .navigationTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}

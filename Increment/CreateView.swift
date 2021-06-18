// CreateView.swift, created on 12/06/21 by jair


import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    
    var dropdownList: some View {
        Group {
            DropdownView(viewModel: $viewModel.excerciseDropdown)
            DropdownView(viewModel: $viewModel.startAmountDropdown)
            DropdownView(viewModel: $viewModel.increaseDropdown)
            DropdownView(viewModel: $viewModel.lengthDropdown)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                Button(action: {
                    viewModel.send(action: .createChallenge)
                }) {
                    Text("Create")
                        .font(.system(size: 24, weight: .medium))
                }
            }
            .navigationTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}

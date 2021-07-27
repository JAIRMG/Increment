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
    
    var mainContentView: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                Button(action: {
                    viewModel.send(action: .createChallenge)
                }) {
                    Text("Create")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.primary)
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                mainContentView
            }
        }
        .alert(isPresented: Binding<Bool>.constant($viewModel.incrementError.wrappedValue != nil)) {
            Alert(
                title: Text("Error!"),
                message: Text($viewModel.incrementError.wrappedValue?.localizedDescription ?? ""),
                dismissButton: .default(Text("Ok"),
                                        action: {
                                            viewModel.incrementError = nil
                                        })
            )
        }
        .navigationTitle("Create")
        .navigationBarBackButtonHidden(true)
        .padding(.bottom, 15)
    }
}

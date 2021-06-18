// CreateView.swift, created on 12/06/21 by jair


import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = CreateChallengeViewModel()
    
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropdownView(viewModel: $viewModel.dropdowns[index])
        }
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text("Select"),
            buttons: viewModel.displayedOptions.indices.map { index in
                let option = viewModel.displayedOptions[index]
                return .default(Text(option.formatted)) {
                    viewModel.send(action: .selectOption(index: index))
                }
            }
        )
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
            .actionSheet(isPresented: Binding<Bool>(
                            get: {
                                viewModel.hasSelectedDropdown
                                
                            }, set: { _ in })) {
                actionSheet
            }
            .navigationTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}

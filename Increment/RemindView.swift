// RemindView.swift, created on 12/06/21 by jair


import SwiftUI

struct RemindView: View {
    var body: some View {
        VStack {
            Spacer()
            //DropdownView()
            Spacer()
            Button(action: { }) {
                Text("Create")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
            }.padding(.bottom, 10)
            Button(action: { }) {
                Text("Skip")
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.primary)
            }
        }
        .navigationTitle("Remind")
        .padding(.bottom, 15)
        
    }
}

struct RemindView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RemindView()
        }
    }
}

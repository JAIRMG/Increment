// PrimaryButtonStyle.swift, created on 12/06/21 by jair
	

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {

    var fillColor: Color = .darkPrimaryButton
    
    func makeBody(configuration: Configuration) -> some View {
        return PrimaryButton(configuration: configuration,
                             fillColor: fillColor)
    }
    
    struct PrimaryButton: View {
        let configuration: Configuration
        let fillColor: Color
        var body: some View {
            return configuration.label
                .padding(20)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(fillColor)
                )
                
        }
        
    }
    
}


struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(action: { }) {
                Text("Create a Challenge")
            }.buttonStyle(PrimaryButtonStyle())
        }
    }
}

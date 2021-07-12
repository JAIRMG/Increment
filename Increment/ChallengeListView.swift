// ChallengeListView.swift, created on 11/07/21 by jair
	

import SwiftUI

struct ChallengeListView: View {
    
    @StateObject private var viewModel = ChallengeListViewModel()
    
    var body: some View {
        Text("Challenge list")
    }
}

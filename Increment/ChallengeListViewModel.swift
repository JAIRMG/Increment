// ChallengeListViewModel.swift, created on 11/07/21 by jair
	

import Foundation

final class ChallengeListViewModel: ObservableObject {

    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    
    init(userService: UserServiceProtocol = UserService(),
         challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
    }
}

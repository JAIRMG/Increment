// ChallengeListViewModel.swift, created on 11/07/21 by jair
	

import Combine

final class ChallengeListViewModel: ObservableObject {

    private let userService: UserServiceProtocol
    private let challengeService: ChallengeServiceProtocol
    private var cancellables: [AnyCancellable] = []
    @Published private(set) var itemViewModels: [ChallengeItemViewModel] = []
    let title = "Challenge"
    
    init(userService: UserServiceProtocol = UserService(),
         challengeService: ChallengeServiceProtocol = ChallengeService()) {
        self.userService = userService
        self.challengeService = challengeService
        
        observeChallenges()
    }
    
    private func observeChallenges() {
        userService.currentUser()
            .compactMap { $0?.uid }
            .flatMap { userId -> AnyPublisher<[Challenge], IncrementError> in
                return self.challengeService.observeChallenges(userId: userId)
            }.sink { completion in
                switch completion {
                case let .failure(error):
                    print(error.localizedDescription)
                case .finished:
                    print("finished")
                }
            } receiveValue: { challenges in
                self.itemViewModels = challenges.map(ChallengeItemViewModel.init)
            }.store(in: &cancellables)
    }
}

// Challenge.swift, created on 22/06/21 by jair
	

import Foundation

struct Challenge: Codable, Hashable {
    let exercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    let userId: String
    let startDate: Date
}

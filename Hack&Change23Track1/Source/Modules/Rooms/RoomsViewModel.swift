//
//  RoomsViewModel.swift
//  Hack&Change23Track1
//
//  Created by Bogdan Zykov on 24.11.2023.
//

import Foundation
import SwiftUI

@MainActor
class RoomsViewModel: ObservableObject {
    
    @Published var rooms: [RoomAttrs] = []
    
    private let roomService = RoomDataService()
    
    func fetchAllRooms() async {
        let rooms = try? await roomService.fetchRooms()
        self.rooms = rooms ?? []
    }
}

//
//  RoomDataService.swift
//  Hack&Change23Track1
//
//  Created by Bogdan Zykov on 24.11.2023.
//

import Foundation

final class RoomDataService {
    
    private let api = Network.shared.client
    
    func fetchRooms() async throws -> [RoomAttrs] {
        let query = ListRoomsQuery()
        let data = try await api.fetch(query: query)
        
        guard let rooms = data?.data?.listRooms?.compactMap({$0?.fragments.roomAttrs}) else {
            throw URLError(.badServerResponse)
        }
        
        return rooms
    }
    
    func createRoom(with name: String) async throws -> RoomAttrs {
        let mutation = CreateRoomMutation(name: name)
        let data = try await api.mutation(mutation: mutation)
        guard let room = data.data?.createRoom?.fragments.roomAttrs else {
            throw URLError(.badServerResponse)
        }
        return room
    }
    
    @discardableResult
    func removeRoom(for id: String) async throws -> String {
        let mutation = DeleteRoomMutation(roomId: id)
        let data = try await api.mutation(mutation: mutation)
           
        guard let roomId = data.data?.deleteRoom?.id else {
            throw URLError(.badServerResponse)
        }
        return roomId
    }
    
    @discardableResult
    func likeRoom(for id: String) async throws -> Int {
        let mutation = LikeRoomMutation(roomId: id)
        let data = try await api.mutation(mutation: mutation)
        
        guard let likes = data.data?.likeRoom?.likes else {
            throw URLError(.badServerResponse)
        }
        return likes
    }
    
    func fetchAudios() async throws -> [FileAttrs] {
        let query = ListAudioQuery()
        let data = try await api.fetch(query: query)
        
        guard let fileAttrs = data?.data?.listAudio?.compactMap({$0?.fragments.fileAttrs}) else {
            throw URLError(.badServerResponse)
        }
        
        return fileAttrs
    }
    
    func initConnection(for roomId: String, offer: SessionDescription) async throws -> SessionDescription {
        let mutation = InitConnectionMutation(sdp: offer.serverSDPParams, roomId: roomId)
        let data = try await api.mutation(mutation: mutation, publishResultToStore: false)
        
        guard let sDPClientAttrs = data.data?.initConnection?.fragments.sDPClientAttrs else {
            throw URLError(.badServerResponse)
        }
        
        return .init(from: sDPClientAttrs)
    }
    
    @discardableResult
    func loadAudio(for roomId: String, audioId: String) async throws -> RoomAttrs {
        
        let mutation = LoadAudioMutation(roomId: roomId, audioId: audioId)
        
        let data = try await api.mutation(mutation: mutation)
        
        guard let room = data.data?.loadAudio?.fragments.roomAttrs else {
            throw URLError(.badServerResponse)
        }
        
        return room
    }
    
    @discardableResult
    func setRoomAction(for roomId: String, action: RoomAction, arg: String = "") async throws -> Bool {
        let mutation = RoomActionMutation(roomId: roomId, action: action.rawValue, arg: arg)
        let data = try await api.mutation(mutation: mutation)
        return data.data?.roomAction?.fragments.roomAttrs != nil
    }
    
}

enum RoomAction: String {
    case play, pause, move
}

extension RoomAttrs: Identifiable {}
extension FileAttrs: Identifiable {}


extension RoomAttrs {
    
    func userIsOwner(for id: String) -> Bool {
        owner?.id == id
    }
    
}
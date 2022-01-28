//
//  DogsList.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import Foundation
import ComposableArchitecture

struct DogsListState: Equatable {
    
    static func == (lhs: DogsListState, rhs: DogsListState) -> Bool {
        return lhs.items == rhs.items
    }
    
    var items: [Dog] = []
    var isLoading = true
    
}

enum DogsListAction {
    case onAppear
    case onDataReceive([Dog])
}

struct DogsListEnvironment {
    
}

let DogsListReducer = Reducer<DogsListState, DogsListAction, DogsListEnvironment> { state, action, environment in
    switch action  {
    case .onAppear:
        return .future{ callback in
            Requester.requestItems() { data in
                callback(.success(.onDataReceive(data)))
            }
        }
    case let .onDataReceive(animals):
        state.items = animals
        state.isLoading = false
        return .none
    }
    
    
}

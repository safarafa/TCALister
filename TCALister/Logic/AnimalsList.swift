//
//  AnimalsList.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import Foundation
import ComposableArchitecture

protocol RequestableItem: Equatable {
    static func request(okHandler: @escaping ([Self]) -> Void)
}

struct AnimalsListState<T: RequestableItem>: Equatable {
    
    static func == (lhs: AnimalsListState, rhs: AnimalsListState) -> Bool {
        lhs.items == rhs.items
    }
    
    var items: [T] = []
    var isLoading = true
    var title = "Some animals"
}

enum AnimalsListAction<T> {
    case onAppear
    case onDataReceive([T])
}

struct AnimalsListEnvironment {
    
}

struct AnimalsListReducer<T: RequestableItem> {
    static func reducer() -> Reducer<AnimalsListState<T>, AnimalsListAction<T>, AnimalsListEnvironment> {
        Reducer<AnimalsListState<T>, AnimalsListAction<T>, AnimalsListEnvironment> { state, action, environment in
            switch action  {
            case .onAppear:
                return .future{ callback in
                    T.request() { data in
                        callback(.success(.onDataReceive(data)))
                    }
                }
            case let .onDataReceive(animals):
                state.items = animals
                state.isLoading = false
                return .none
            }
        }
    }
}

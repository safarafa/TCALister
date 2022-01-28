//
//  MenuList.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import Foundation
import SwiftUI
import ComposableArchitecture

struct MenuListState: Equatable {

    static func ==(lhs: MenuListState, rhs: MenuListState) -> Bool {
        lhs.items == rhs.items
    }

    var items: [MenuItem] = []
    var isLoading = true
}

enum MenuListAction {
    case onAppear
    case onDataReceive([MenuItem])
}

struct MenuListEnvironment {

}

let MenuListReducer = Reducer<MenuListState, MenuListAction, MenuListEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        return .future { callback in
            Requester.requestMenuItems() { data in
                callback(.success(.onDataReceive(data)))
            }
        }
    case let .onDataReceive(items):
        state.items = items
        state.isLoading = false
        return .none
    }
}

extension MenuItem {

    func destination() -> AnimalsListView {
        AnimalsListView(store: Store(
                initialState: AnimalsListState<Dog>(title: "Dogs"),
                reducer: AnimalsListReducer<Dog>.reducer(),
                environment: AnimalsListEnvironment()
        ))
    }
}

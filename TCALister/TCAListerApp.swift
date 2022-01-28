//
//  TCAListerApp.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAListerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialState: AppState(),
                    reducer: appReducer,
                    environment: AppEnvironment()
                    )
                )
        }
    }
}

struct AppState: Equatable {
    
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        return lhs.items == rhs.items
    }
    
    var items: [Animal] = []
    var isLoading = true
    
}

enum AppAction {
    case onAppear
    case onDataReceive([Animal])
}

struct AppEnvironment {
    
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
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

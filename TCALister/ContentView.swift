//
//  ContentView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            WithViewStore(self.store) { viewStore in
                ZStack {
                    List {
                        ForEach(viewStore.state.items, id: \.id) { item in
                            VStack(
                                alignment: .leading)
                            {
                                Text(item.title)
                                    .font(.system(size: 20))
                                    .foregroundColor(.blue)
                                if let subTitle = item.subTitle {
                                    Text(subTitle)
                                        .font(.system(size: 16, weight: .light))
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                    .navigationTitle("Animals")
                    .onAppear { viewStore.send(.onAppear) }
                    if viewStore.state.isLoading {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: AppState(
                    items:  [
                        Animal(id: "1", title: "Item 1"),
                        Animal(id: "2", title: "Item 2", subTitle: "Test")]),
                reducer: appReducer,
                environment: AppEnvironment()
            )
        )
        
    }
}

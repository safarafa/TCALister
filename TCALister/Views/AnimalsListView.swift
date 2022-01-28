//
//  ContentView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct AnimalsListView: View {
    let store: Store<AnimalsListState<Dog>, AnimalsListAction<Dog>>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                List {
                    ForEach(viewStore.state.items, id: \.id) { item in
                        DogListItemView(dog: item)
                    }
                }
                .navigationTitle(viewStore.state.title)
                .onAppear { viewStore.send(.onAppear) }
                if viewStore.state.isLoading {
                    ProgressView()
                }
            }
        }
    }
}

//
//  ContentView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct AnimalsListView<T: RequestableItem> : View {
    let store: Store<AnimalsListState<T>, AnimalsListAction<T>>
    let itemView: (T) -> AnyView
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            ZStack {
                List {
                    ForEach(viewStore.state.items, id: \.id) { item in
                        NavigationLink(destination: ProcessStepView()) {
                            itemView(item)
                        }
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

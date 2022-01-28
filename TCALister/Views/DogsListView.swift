//
//  ContentView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 16/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct DogsListView: View {
    let store: Store<DogsListState, DogsListAction>
    
    var body: some View {
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
                    .navigationTitle("Dogs")
                    .onAppear { viewStore.send(.onAppear) }
                    if viewStore.state.isLoading {
                        ProgressView()
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DogsListView(
            store: Store(
                initialState: DogsListState(
                    items:  [
                        Dog(id: "1", title: "Dog 1"),
                        Dog(id: "2", title: "Dog 2", subTitle: "Dalmatian")]),
                reducer: DogsListReducer,
                environment: DogsListEnvironment()
            )
        )
        
    }
}



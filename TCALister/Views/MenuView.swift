//
//  MenuView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct MenuView: View {
    let store: Store<MenuListState, MenuListAction> = Store(initialState: MenuListState(), reducer: MenuListReducer, environment: MenuListEnvironment())
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ZStack {
                    List {
                        ForEach(viewStore.state.items, id: \.id) { item in
                            NavigationLink(item.title, destination: item.destination())
                        }
                    }
                    if viewStore.state.isLoading {
                        ProgressView()
                    }
                }
                .navigationTitle("Animals")
                .onAppear {
                    viewStore.send(.onAppear)
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

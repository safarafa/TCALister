//
//  MenuView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct MenuView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Dogs", destination: DogsListView(store: Store(
                    initialState: DogsListState(),
                    reducer: DogsListReducer,
                    environment: DogsListEnvironment()
                    )))
            }
            .navigationTitle("Animals")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

//
//  ProcessStepView.swift
//  TCALister
//
//  Created by Tomasz Serafin on 28/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct ProcessStepView: View {
    let store: Store<AdoptionProcessState, AdoptionProcessAction> = Store(initialState: AdoptionProcessState(),
                                                                          reducer: adoptionProcessReducer,
                                                                          environment: AdoptionProcessEnvironment())
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Text(viewStore.state.headerText)
                        .font(.title2)
                        .padding(.top)
                        .foregroundColor(.white)
                Text(viewStore.state.descriptionText)
                        .foregroundColor(.white)
                Spacer()
                ForEach(viewStore.state.steps, id: \.stepNo) { item in
                    HStack {
                        Image(systemName: item.stepNo.description + ".circle")
                                .font(.title)
                                .foregroundColor(.white)
                        VStack(alignment: .leading) {
                            Text(item.title)
                                    .font(.title2)
                                    .foregroundColor(.white)
                            if item.active {
                                Text(item.description)
                                        .foregroundColor(.white)
                            }
                        }
                    }
                            .padding(.bottom)
                            .opacity(item.active ? 1.0 : 0.7)
                }
                Spacer()
                NavigationLink("(form test)", destination: PhoneNumberForm())
                        .font(.title)
                        .foregroundColor(.white)
                Spacer()
                PrimaryBigWhiteButton(title: "Let's begin!") {
                    viewStore.send(.beginTapped)
                }
            }
                    .padding()
                    .navigationBarHidden(true)
                    .background(Color.accentColor
                                        .ignoresSafeArea()
                    )
        }
    }
}


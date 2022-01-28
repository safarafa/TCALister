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
                                                                          environment: AdoptionProcessEnvirontment())
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .leading) {
                Spacer()
                Text(viewStore.state.headerText)
                    .font(.title2)
                Text(viewStore.state.descriptionText)
                List {
                    ForEach(viewStore.state.steps, id: \.stepNo) { item in
                        HStack {
                            Image(systemName: item.stepNo.description + ".circle")
                                .font(.title)
                                .foregroundColor(viewStore.state.currentStep == item.stepNo ? .black : .gray)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.title2)
                                    .foregroundColor(viewStore.state.currentStep == item.stepNo ? .black : .gray)
                                if viewStore.state.currentStep == item.stepNo {
                                    Text(item.description)
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
                Text("Let's begin!")
                    .font(.title)
                    .padding()
                    .background(Color.accentColor)
                Spacer()
            }
            .padding()
        }        
    }
}

struct AdoptionProcessStep {
    let stepNo: Int
    let title: String
    let description: String
}

struct AdoptionProcessState: Equatable {
    let headerText = "Let the adoption process begin!"
    let descriptionText = "You will have to fill some forms."
    var currentStep = 1
    let steps: [AdoptionProcessStep] = [
        AdoptionProcessStep(stepNo: 1, title: "Phone number", description: "On this step we need you to input your phone number. We will send you SMS to confirm that you are an owner of this number."),
        AdoptionProcessStep(stepNo: 2, title:"Number confirmation", description: "On this step you input SMS code, which was sent to you."),
        AdoptionProcessStep(stepNo: 3, title: "PIN", description: "On this step you set PIN, which is later used to pick up adopted animal.")
    ]
    
    static func == (lhs: AdoptionProcessState, rhs: AdoptionProcessState) -> Bool {
        lhs.headerText == rhs.headerText
    }
}

enum AdoptionProcessAction {
    
}

struct AdoptionProcessEnvirontment {
    
}

let adoptionProcessReducer = Reducer<AdoptionProcessState, AdoptionProcessAction, AdoptionProcessEnvirontment> { state, action, environment in
    return .none
}

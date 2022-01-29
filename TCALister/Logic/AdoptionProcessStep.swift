import Foundation
import ComposableArchitecture

struct AdoptionProcessStep {
    let stepNo: Int
    let title: String
    let description: String
    var active = false
}

struct AdoptionProcessState: Equatable {
    let headerText = "Let the adoption process begin!"
    let descriptionText = "You will have to fill some forms."
    var currentStep = 1
    var steps: [AdoptionProcessStep] = [
        AdoptionProcessStep(stepNo: 1, title: "Phone number", description: "On this step we need you to input your phone number. We will send you SMS to confirm that you are an owner of this number.", active: true),
        AdoptionProcessStep(stepNo: 2, title:"Number confirmation", description: "On this step you input SMS code, which was sent to you."),
        AdoptionProcessStep(stepNo: 3, title: "PIN", description: "On this step you set PIN, which is later used to pick up adopted animal.")
    ]

    static func == (lhs: AdoptionProcessState, rhs: AdoptionProcessState) -> Bool {
        lhs.headerText == rhs.headerText && lhs.currentStep == rhs.currentStep
    }
}

enum AdoptionProcessAction {
    case beginTapped
}

struct AdoptionProcessEnvironment {

}

let adoptionProcessReducer = Reducer<AdoptionProcessState, AdoptionProcessAction, AdoptionProcessEnvironment> { state, action, environment in
    switch action {
    case .beginTapped:
        state.steps[state.currentStep - 1].active = false
        state.currentStep = state.currentStep % 3 + 1
        state.steps[state.currentStep - 1].active = true
        return .none
    }
}

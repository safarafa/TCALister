//
//  FormTextField.swift
//  TCALister
//
//  Created by Tomasz Serafin on 30/01/2022.
//

import SwiftUI
import ComposableArchitecture

struct FormTextField: View {

    let store: Store<TextFieldFormListState, TextFieldFormListAction>

    init(title: String, validationText: String) {
        store = Store(initialState: TextFieldFormListState(title: title,
                                                           errorText: validationText,
                                                           isValidationError: false,
                                                           isAccepted: false,
                                                           hasValidationError: { number in
                                                               let PHONE_REGEX = "^[0-9]{9}$"
                                                               let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                                                               let result = phoneTest.evaluate(with: number)
                                                               return !result
                                                           },
                                                           isAcceptable: { number in
                                                               let PHONE_REGEX = "^[0-9]{9}$"
                                                               let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
                                                               let result = phoneTest.evaluate(with: number)
                                                               return result
                                                           },
                                                           result: ""),
                      reducer: TextFieldFormListReducer.reducer(),
                      environment: TextFieldFormListEnvironment())
    }


    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(alignment: .leading) {
                HStack {
                    Text(viewStore.state.title)
                    Spacer()
                    if viewStore.state.isAccepted {
                        Image(systemName: "checkmark.square")
                                .foregroundColor(.success)
                                .font(.title3)
                    }
                }
                TextField("", text: viewStore.binding(get: \.result,
                                                      send: TextFieldFormListAction.onTextChange),
                          onEditingChanged: { started in viewStore.send(.editingChanged(started)) }
                )
                        .keyboardType(.numberPad)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                         .stroke(viewStore.state.isValidationError ? Color.error : Color.white, lineWidth: 2))
                        .background(Color.white)
                        .cornerRadius(5)
                if viewStore.state.isValidationError {
                    Text(viewStore.state.errorText)
                            .foregroundColor(.error)
                            .font(.caption)
                            .padding(.bottom)
                }
            }
        }
    }
}

struct FormTextField_Previews: PreviewProvider {
    static var previews: some View {
        FormTextField(title: "Caption", validationText: "Error text")
    }
}


struct TextFieldFormListState: Equatable {

    static func ==(lhs: TextFieldFormListState, rhs: TextFieldFormListState) -> Bool {
        lhs.isValidationError == rhs.isValidationError && lhs.isAccepted == rhs.isAccepted && lhs.result == rhs.result
    }

    let title: String
    let errorText: String
    var isValidationError = false
    var isAccepted = false
    let hasValidationError: (String) -> Bool
    let isAcceptable: (String) -> Bool
    var result = ""
}

enum TextFieldFormListAction {
    case editingChanged(Bool)
    case onTextChange(String)
}

struct TextFieldFormListEnvironment {

}

struct TextFieldFormListReducer {
    static func reducer() -> Reducer<TextFieldFormListState, TextFieldFormListAction, TextFieldFormListEnvironment> {
        Reducer<TextFieldFormListState, TextFieldFormListAction, TextFieldFormListEnvironment> { state, action, environment in
            switch action {
            case let .editingChanged(hasBegun):
                if hasBegun {
                    state.isValidationError = false
                } else {
                    state.isValidationError = state.hasValidationError(state.result)
                }
                return .none
            case let .onTextChange(newText):
                state.result = newText
                state.isAccepted = state.isAcceptable(newText)
                return .none
            }
        }
    }
}

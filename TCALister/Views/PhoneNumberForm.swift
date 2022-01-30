//
//  PhoneNumberForm.swift
//  TCALister
//
//  Created by Tomasz Serafin on 29/01/2022.
//

import SwiftUI

struct PhoneNumberForm: View {
    @State var phoneNumber: String = ""
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Please input your phone number")
                    Spacer()
                    Image(systemName: "checkmark.square")
                        .foregroundColor(.success)
                        .font(.title2)
                }
                TextField("", text: $phoneNumber)
                    .padding()
                    .background(Color.white)
                Text("Too few digits")
                    .foregroundColor(.error)
                    .font(.caption)
                Spacer()
                PrimaryBigDarkButton(title: "Dalej") {
                
                }
            }
            .padding()
            .navigationTitle("Phone number")
            .background(Color.lessIntense
                            .ignoresSafeArea())
        }
    }
}

struct PhoneNumberForm_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberForm()
    }
}

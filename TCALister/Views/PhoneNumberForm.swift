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
                FormTextField(title: "Please input your phone number",
                              validationText: "Phone number should have 9 digits")
                Spacer()
                PrimaryBigDarkButton(title: "Next") {

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

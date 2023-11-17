//
//  AccountView.swift
//  Appetizers
//
//  Created by Maryam on 2023-11-02.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var FocusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($FocusedTextField, equals: .firstName)
                        .onSubmit { FocusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($FocusedTextField, equals: .lastName)
                        .onSubmit { FocusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($FocusedTextField, equals: .email)
                        .onSubmit { FocusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
//                    DatePicker("Birthday",
//                               selection: $viewModel.user.birthdate,
//                               displayedComponents: .date)
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               in: Date().oneHundredTenYearsAgo...Date().eighteenYearsAgo,
                               displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section("Requests") {
                    Toggle(isOn: $viewModel.user.extraNapkins) {Text("Extra Napkins")}
                    Toggle(isOn: $viewModel.user.frequentRefills) {Text("Frequent Refills")}
                }.toggleStyle(SwitchToggleStyle(tint: Color.brandPrimary))
            }
            .navigationTitle("👤 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") { FocusedTextField = nil }
                }
            }
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message:alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

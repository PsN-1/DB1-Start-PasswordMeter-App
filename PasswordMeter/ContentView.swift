//
//  ContentView.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 12/05/21.
//

import SwiftUI

struct ContentView: View {
    @State var passwordInput: String = ""
    @State var isShowingPassword = false
    @State private var isShowingResultsView = false
    
    var body: some View {
        NavigationView{
            VStack {
                Group {
                    HStack {
                        if isShowingPassword {
                            TextField("Password: ", text: $passwordInput).padding()
                        } else {
                            SecureField("Password: ", text: $passwordInput).padding()
                        }
                        Button(action: {
                            isShowingPassword.toggle()
                        }) {
                            Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill" )
                                .foregroundColor(isShowingPassword ? .secondary : .blue)
                        }
                    }
                    .padding(.trailing)
                    .background(Color(red: 233/255, green: 234/255, blue: 243/255))
                    .cornerRadius(15)
                }
                Button(action: { isShowingResultsView = true }) {
                    Text("Submit")
                        .fixedSize()
                        .frame(width: 140, height: 35)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                    .padding()
            }
            .offset(x: 0, y: -50)
            .padding()
            .navigationBarTitle("Password Meter")
            .sheet(isPresented: $isShowingResultsView) {
                 ResultsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("Iphone 12")
    }
}

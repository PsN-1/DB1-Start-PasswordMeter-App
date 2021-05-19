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
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView{
            VStack {
                Group {
                    HStack {
                        Text("Password: ") .padding(.leading)
                        if isShowingPassword {
                            TextField("Password", text: $passwordInput).padding()
                                .frame(height: 55)
                        } else {
                            SecureField("Password", text: $passwordInput).padding()
                                .frame(height: 55)
                        }
                        
                        Button(action: {
                            isShowingPassword.toggle()
                        }) {
                            Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill" )
                                .foregroundColor(isShowingPassword ? .secondary : .blue)
                        }
                    }
                    .padding(.trailing)
                    .background(colorScheme == .light ? Color(red: 233/255, green: 234/255, blue: 243/255) : Color(.lightGray))
                    .cornerRadius(15)
                }
                Button(action: {
                    isShowingResultsView = true
                }) {
                    Text("Submit")
                        .fixedSize()
                        .frame(width: 140, height: 40)
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
                
                let additions = PasswordVariablesCalculator(passwordInput).calculateAdditionsOfPasswordStrength()
                let deductions = PasswordVariablesCalculator(passwordInput).calculateDeductionsOfPasswordStrength()
                let score = Score(passwordInput).getScore()
                let complexity = PasswordComplexity(score).calculatePasswordComplexity()
                ResultsView(
                    password: passwordInput,
                    resultsOfAdditions: additions,
                    resultsOfDeductions: deductions,
                    score: score,
                    complexity: complexity
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

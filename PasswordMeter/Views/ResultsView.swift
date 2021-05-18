//
//  ResultsView.swift
//  PasswordMeter
//
//  Created by Pedro Neto on 13/05/21.
//

import SwiftUI

struct ResultsView: View {
    @State var password: String
    @State private var isShowingPassword = false
    
    var resultsAdditions: [Results]
    var resultsDeductions: [Results]
    var score: Int
    var complexity: String
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Password Meter")) {
                    HStack {
                        Text("Password: ")
                        if isShowingPassword {
                            TextField("Password", text: $password).padding()
                                .font(Font.body.bold())
                                .disabled(true)
                                .frame(height: 40)
                        } else {
                            SecureField("Password", text: $password).padding()
                                .font(Font.body.bold())
                                .disabled(true)
                                .frame(height: 40)
                        }
                        Button(action: {
                            isShowingPassword.toggle()
                        }) {
                            Image(systemName: isShowingPassword ? "eye.slash.fill" : "eye.fill" )
                                .foregroundColor(isShowingPassword ? .secondary : .blue)
                        }
                    }

                    HStack {
                        Text("Score: ")
                        ZStack {
                            ProgressView(value: Double(Double(score)/100))
                                .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                                
                                .scaleEffect(x: 1, y: 7, anchor: .center)
                            Text("\(score)%")
                                .multilineTextAlignment(.leading)
                        }

                    }
                    Text("Complexity: \(complexity)")
                }
                
                Section(header:
                            HStack {
                                Text("Additions")
                                Spacer()
                                Text("Count")
                                Text("Bonus")
                            }
                ) {
                    ForEach(0..<resultsAdditions.count) { i in
                        HStack{
                            
                            Image(systemName: resultsAdditions[i].requirementLevel.rawValue)
                                .foregroundColor(resultsAdditions[i].requirementLevel.imageColor)
                            Text("\(resultsAdditions[i].className)")
                            Spacer()
                            Text("\(resultsAdditions[i].count)")
                            
                            if resultsAdditions[i].bonus > 9 {
                                Text("  ")
                            } else {
                                Text("    ")
                            }
                            
                            Text("\(resultsAdditions[i].bonus)")
                        }
                    }
                }
                Section(header:
                            HStack {
                                Text("Deductions")
                                Spacer()
                                Text("Count")
                                Text("Bonus")
                            }
                ) {
                    ForEach(0..<resultsDeductions.count) { i in
                        HStack{
                            
                            Image(systemName: resultsDeductions[i].requirementLevel.rawValue)
                                .foregroundColor(resultsDeductions[i].requirementLevel.imageColor)
                            Text("\(resultsDeductions[i].className)")
                            Spacer()
                            Text("\(resultsDeductions[i].count)")
                            
                            if resultsDeductions[i].bonus > 9 {
                                Text(" ")
                            } else if resultsDeductions[i].bonus > 0 {
                                Text("   ")
                            } else {
                                Text("    ")
                            }
                            
                            if resultsDeductions[i].bonus > 0 {
                                Text("-\(resultsDeductions[i].bonus)")
                            } else {
                                Text("\(resultsDeductions[i].bonus)")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(password: "12345678", resultsAdditions: [NumberOfCharacters("12345678").getResult()], resultsDeductions: [LettersOnly("4379").getResult()], score: 75, complexity: "Strong")
    }
}

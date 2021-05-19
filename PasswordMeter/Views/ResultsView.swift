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
    
    var resultsOfAdditions: [Results]
    var resultsOfDeductions: [Results]
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
                    ForEach(0..<resultsOfAdditions.count) { i in
                        HStack{
                            
                            Image(systemName: resultsOfAdditions[i].requirementLevel.rawValue)
                                .foregroundColor(resultsOfAdditions[i].requirementLevel.imageColor)
                            Text("\(resultsOfAdditions[i].className)")
                            Spacer()
                            Text("\(resultsOfAdditions[i].count)")
                            
                            if resultsOfAdditions[i].bonus > 9 {
                                Text("  ")
                            } else {
                                Text("    ")
                            }
                            
                            Text("\(resultsOfAdditions[i].bonus)")
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
                    ForEach(0..<resultsOfDeductions.count) { i in
                        HStack{
                            
                            Image(systemName: resultsOfDeductions[i].requirementLevel.rawValue)
                                .foregroundColor(resultsOfDeductions[i].requirementLevel.imageColor)
                            Text("\(resultsOfDeductions[i].className)")
                            Spacer()
                            Text("\(resultsOfDeductions[i].count)")
                            
                            if resultsOfDeductions[i].bonus > 9 {
                                Text(" ")
                            } else if resultsOfDeductions[i].bonus > 0 {
                                Text("  ")
                            } else {
                                Text("    ")
                            }
                            
                            if resultsOfDeductions[i].bonus > 0 {
                                Text("-\(resultsOfDeductions[i].bonus)")
                            } else {
                                Text("\(resultsOfDeductions[i].bonus)")
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
        ResultsView(password: "12345678", resultsOfAdditions: [NumberOfCharacters("12345678").getResult()], resultsOfDeductions: [LettersOnly("4379").getResult()], score: 75, complexity: "Strong")
    }
}

//
//  ContentView.swift
//  Challenge08
//
//  Created by Vini Oliveira  on 25/09/25.
//

import SwiftUI
import CoreML
import NLModel


struct ContentView: View {
    
    @State var output: String = ""
    @State var inputText: String = ""
    var predict = PredictText()
    
    var body: some View {
        VStack {
            TextField(
                "input",
                text: $inputText
            )
            .textFieldStyle(.roundedBorder)
            .onSubmit {
                if let output = predict.predictModel(input: inputText) {
                    self.output = output
                }
            }
            Text(output)
                .foregroundStyle(output == "positivo" ? .green : .red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

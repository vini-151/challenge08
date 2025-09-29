//
//  ContentView.swift
//  Challenge08
//
//  Created by Vini Oliveira  on 25/09/25.
//

import SwiftUI
import CoreML
import NLModel
import HandGesturesClassifier


struct ContentView: View {
    
    @State var output: String = ""
    @State var inputText: String = ""
    
    @State private var gesture: HandPoses = .background
    @State private var isCameraHidden: Bool = false
    
    var predict = PredictText()
    
    var body: some View {
            

            
        VStack {
            ARViewContainer(
                gesture: $gesture,
                cameraFrame: CGRect(x: 0, y: 0, width: 100, height: 100),
                isCameraHidden: $isCameraHidden
            )
            
            TextField(
                "input",
                text: $inputText
            )
            .textFieldStyle(.roundedBorder)
            .onSubmit {
            }
            Text(output)
        }
        .padding()
        .onChange(of: gesture) { _, newValue in
            if gesture.rawValue == "aberta"{
                if let output = predict.predictModel(input: inputText) {
                    self.output = output
                    print(self.output)
                }
            }else if gesture.rawValue == "fechada"{
                output = ""
                inputText = ""
            }
            
        }
        .padding()
            
        

    }
}

#Preview {
    ContentView()
}

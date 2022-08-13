//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct ClassificationView: View {
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    @State private var showAbout = false
    @State private var selectedArea = Area.seattle
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel
        ZStack(alignment: .topLeading) {
            NavigationLink(destination: AboutView(), isActive: $showAbout) {
                EmptyView()
            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel, area: selectedArea))
            }
            HStack(alignment: .bottom) {
                LiveCameraRepresentable() {
                    predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                }
                Picker("Title", selection: $selectedArea, content: {
                    Text("Seattle").tag(Area.seattle)
                        .tag(Area.newYork)
                        .font(.largeTitle)
                
                    Text("New York")
                        .tag(Area.newYork)
                        .font(.largeTitle)
                })
                Spacer(minLength: 100)
            }
        }// VStack
        .onAppear(perform: classifierViewModel.loadJSON)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button( action: {
                    self.showAbout = true
                }) {
                    Text("About")
                        .foregroundColor(Color("2"))
                }
            }
        }
            .background(Color("4"))
            .edgesIgnoringSafeArea(.all)
            .shadow(radius: 50)
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
    }
}

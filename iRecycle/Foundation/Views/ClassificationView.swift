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
        ZStack(alignment: .top) {
            NavigationLink(destination: AboutView(), isActive: $showAbout) {
                EmptyView()
            }
            LiveCameraRepresentable() {
                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel, area: selectedArea))
            VStack(alignment: .center) {
                Spacer().frame(height: 180)
                Picker("Title", selection: $selectedArea) {
                    Text("Seattle")
                        .tag(Area.seattle)
                    Text("Portland")
                        .tag(Area.portland)
                    Text("San Francisco")
                        .tag(Area.sanFrancisco)
                    Text("New York")
                        .tag(Area.newYork)
                    Text("Washington, DC")
                        .tag(Area.dc)
                }
                .pickerStyle(.segmented)
                .frame(width: 800)
            }
        } //ZStack
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

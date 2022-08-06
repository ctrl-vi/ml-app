//
//  LaunchScreenView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            VStack {
                // Logo
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                
                // title
                Text("iRecycle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(Color("2"))
                
                Divider().frame(maxWidth: 300)
                
                // info
                // TODO: Replace with description of your app
                VStack(spacing: 20) {
                    Text("Sort your waste between trash, recycling, and compost!")
                    
                    Text("This app uses the camera and AR (powered by ML) to identify your waste and sort it.")
                    
                    Text("To get started, grab some waste, and this app will sort it into these three categories!")
                }
                .padding()
                .multilineTextAlignment(.center)
                
                // item list
                // TODO: replace with the names of your items
                HStack(alignment: .center, spacing: 10) {
                    VStack {
                        Text("🗑")
                        Text("Trash")
                    }
                    .padding()
                    
                    VStack {
                        Text("♻️")
                        Text("Recycling")
                    }
                    .padding()
                    
                    VStack {
                        Text("🌱")
                        Text("Compost")
                    }
                    .padding()
                    
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .padding()
                
                // start button
                NavigationLink(destination: ClassificationView()){
                    Text("Start!")
                }
                .buttonStyle(RoundedRectButtonStyle())
                .padding()
                
                // byline
                Text("Created by Pari Aiyer, Vi Monserate, and Chelsea Liu")
                    .font(.caption)
                    .padding()
            }
            .padding()
            .frame(maxWidth: 500)
            .background(Color("4"))
            .cornerRadius(25)
            .shadow(radius: 5)
            
        }// VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("3"))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            if #available(iOS 15.0, *) {
                LaunchScreenView()
                    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch)"))
                    .previewInterfaceOrientation(.landscapeLeft)
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

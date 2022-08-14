//
//  PredictionResultView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        ZStack(){
            VStack(){
                Spacer()
                    .frame(height:30)
                HStack(alignment: .top) {
                    Text(labelData.emoji)
                        .font(.system(size: 100))
                        .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        Text(labelData.label.capitalized)
                            .font(.title)
                        
                        Text(labelData.desc)
                        .padding(.init(top: 3, leading: 0, bottom: 5, trailing: 5))
                    }
                    .padding(5)
                }// HStack
                .background(Color("1"))
                .cornerRadius(20)
                .padding(15)
                .shadow(radius: 5)
                .frame(width: 800)
            }
        }
    }
}
struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}

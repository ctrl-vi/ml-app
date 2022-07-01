//
//  AboutView.swift
//  coreML-starter
//
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                    colors: [Color("4"), Color("3")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Text("About the Creators!")
                    .font(.title)
                    .foregroundColor(Color("2"))
                    .fontWeight(.bold)
                Spacer().frame(height: 30)
                HStack (spacing: 30){
                    VStack(alignment: .center) {
                        Image("Vi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 5)
                        Text("Violet \nMonserate")
                            .foregroundColor(Color("2"))
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            
                        Text("\"I am 17 years old and attend Raisbeck Aviation High School. My interests lie in activism and all things techy! This app could be the future of environmental advocacy, available to all!\"\n")
                            .foregroundColor(Color("2"))
                            .font(.caption)
                            .italic()
                            .multilineTextAlignment(.center)
                    }
                    VStack(alignment: .center) {
                        Image("Chelsea")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 5)
                        Text("Chelsea \nLiu")
                            .foregroundColor(Color("2"))
                            .font(.body)
                            .fontWeight(.semibold)
                        
                            .multilineTextAlignment(.center)
                            
            
                        Text("\"I am a 17 year old rising senior at Lakeside School, and I am hoping to study subjects such as business and tech. I think this app is an awesome way to show how tech can impact the world!\"")
                            .foregroundColor(Color("2"))
                            .italic()
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    VStack(alignment: .center) {
                        Image("Pari")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(radius: 5)
                        Text("Pari \nAiyer")
                            .foregroundColor(Color("2"))
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            
                        Text("\"I am a rising junior in the greater Seattle area. I love exploring the role of design in a technology driven world and am always striving towards living a more sustainable life\"\n\n")
                            .foregroundColor(Color("2"))
                            .italic()
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }
                    
                }
                Text("As ambitious Kode with Klossy scholars and advocates for the environment, Violet, Chelsea, and Pari felt a responsibility to utilize their programming superpowers for good. They, as consumers, got extremely confused while sorting trash, leaving them thinking \"Why is this so difficult?\" Realizing that there was nothing currently in the market, they created \"iRecycle\": the simpler and quicker way to identify waste. With a simple point of a camera, you too can sort your trash and do your part for mother nature!")
                    .padding()
                    .foregroundColor(Color("2"))
                    .font(.body)

            }
            .padding(.init(top: 0, leading: 30, bottom: 0, trailing: 30 ))
        }
    }
        
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

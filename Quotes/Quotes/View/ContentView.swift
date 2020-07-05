//
//  ContentView.swift
//  Quotes
//
//  Created by Bhasin Naik on 05/07/20.
//  Copyright © 2020 rang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var quotes: [Quote]
    var body: some View {
        VStack {
            CircleImage(imageName: "lilly")
                .frame(width:160, height: 160)
                .padding(.top,89)
                .padding(.bottom,20)
            MainView(quotes: quotes)
            Spacer()
        }.background(Image("motivation_bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
    }
}
struct  MainView: View {
    //MARK: View to create quotes card
    var quotes: [Quote]
    var body: some View {
        VStack{
            
            HStack{
                Text("\(self.quotes.count) Quotes Available!")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.white)
                
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.quotes, id:\.name) {
                        quote in
                        VStack {
                            CircleImage(imageName: "lilly")
                            Text(#" "\#(quote.quote) " "#)
                                .font(.headline)
                                
                            Divider()
                            Text(quote.name)
                                .italic()
                                .font(.subheadline)
                        }.frame(width:300, height:300)
                            .foregroundColor(.gray)
                            .padding(.all,4)
                            .background(Color.white)
                            .cornerRadius(13)
                            .overlay(Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors:[.clear,.pink]),
                                                   startPoint: .center, endPoint: .topLeading))
                                .clipped()
                                .shadow(radius: 8))
                    }
                }
            }
        }
    }
}

struct CircleImage: View{
    //MARK: View to create Circle Image
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.gray,lineWidth: 2))
            .frame(width:100, height:100)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        return ContentView(quotes: quoteData)
    }
}

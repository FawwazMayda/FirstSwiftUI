//
//  AboutView.swift
//  FirstSwiftUI
//
//  Created by Muhammad Fawwaz Mayda on 18/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let beige = Color(red: 1.0, green: 214.0/255.0, blue: 179.0/255.0)
    struct HeadingStyle:ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 30.0))
                .padding(.top, 20.0)
                .padding(.bottom, 20.0)
        }
    }
    
    struct BodyStyle:ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 16.0))
                .padding(.bottom, 20.0)
                .padding(.leading, 60.0)
                .padding(.trailing, 60.0)
        }
    }
    
    
    var body: some View {
        Group {
            VStack {
                Text(" 🎯 Bulls Eye 🎯").modifier(HeadingStyle())
                Text(" This is a bullseye game where you can earn fame by dragging a slider").modifier(BodyStyle())
                Text("Your goal is to place slider as close as to target value. The closer you are, the more points you score").modifier(BodyStyle())
                Text("Enjoy").modifier(BodyStyle())
            }.navigationBarTitle(Text("About Bullseye")).background(beige)
        }.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

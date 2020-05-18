//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by Muhammad Fawwaz Mayda on 16/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI
// How to calculate the slider value
// Get both value of slider and target
// if target>slider : value = target-slider
// else : value = slider-targer
struct Obj {
    public var isVisible = true
}
struct ContentView: View {
    @State var obj = Obj()
    @State var alertVisible = false
    @State var sliderValue = 10.0
    @State var knockVisible = false
    @State var target = Int.random(in: 1...100)
    var body: some View {
        VStack {
            
            //Target Row
            HStack {
                Text("Put the bulleye as close ad you can:")
                Text("\(target)")

            }
            //Slider Row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            //Button Row
            Button(action: {
                print("Button Pressed")
                self.alertVisible = true
                self.obj.isVisible = !self.obj.isVisible
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertVisible) { () -> Alert in
                return Alert(title: Text("Hello There"), message: Text("The slider value is :\(sliderValueRounded()) Your current point is: \(pointsForCurrentRound())"), dismissButton: .default(Text("Awesome")))
            }
            
            //Score row
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score")
                Text("999")
                Spacer()
                Text("Round")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }.padding(.all, 20.0)
    }
}
    func pointsForCurrentRound() -> Int {
        return 100 - abs(target - sliderValueRounded())
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

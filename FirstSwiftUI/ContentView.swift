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
    @State var score = 0
    @State var round = 1
    let midnightBlue = Color(red: 0.0/255.0, green: 51.0/255/0, blue: 102.0/255.0)
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.white)
            .modifier(Shadow())
                .font(.custom("Arial Rounded MT Bold", size: 18.0))
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.yellow)
                .font(.custom("Arial Rounded MT Bold", size: 24.0))
            .modifier(Shadow())
        }
    }
    
    struct Shadow:ViewModifier {
        func body(content: Content) -> some View {
            content.shadow(color: .black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct LargeButtonStyle:ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 18.0))
        }
    }
    
    struct SmallButtonStyle:ViewModifier {
        func body(content: Content) -> some View {
            content.foregroundColor(.black)
                .font(.custom("Arial Rounded MT Bold", size: 12.0))
        }
    }
    var body: some View {
        VStack {
            
            //Target Row
            HStack {
                Text("Put the bulleye as close ad you can:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())

            }
            //Slider Row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }.accentColor(.green)
            
            //Button Row
            Button(action: {
                print("Button Pressed")
                self.alertVisible = true
            }) {
                Text("Hit me").modifier(LargeButtonStyle())
                }.background(Image("Button"))
                
            .alert(isPresented: $alertVisible) { () -> Alert in
                return Alert(title: Text("\(alertTitle())"), message: Text("The slider value is :\(sliderValueRounded()) Your current point is: \(pointsForCurrentRound())"), dismissButton: .default(Text("Awesome")) {
                    self.score = self.score + self.pointsForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.round += 1
                    })
            }
            
            //Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(SmallButtonStyle())
                    }
                }.background(Image("Button"))
                Spacer()
                
                Text("Score:").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                Spacer()
                
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(SmallButtonStyle())
                    }
                }.background(Image("Button"))
            }.padding(.all, 20.0)
            }.background(Image("Background"), alignment: .center).accentColor(midnightBlue)
}
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    func pointsForCurrentRound() -> Int {
        let maxScore = 100
        let differences = amountOff()
        let bonus : Int
        if differences==0 {
            bonus = 100
        } else if differences==1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maxScore - differences + bonus
    }
    
    func sliderValueRounded() -> Int {
        return Int(sliderValue.rounded())
    }
    
    func alertTitle()-> String {
        let title : String
        if amountOff()==0 {
            title = "Perfect you had it"
        } else if amountOff()<5 {
            title = "You almost had it"
        } else if amountOff() <= 10 {
            title = "Not bad"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetGame() {
        score = 0
        round = 0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

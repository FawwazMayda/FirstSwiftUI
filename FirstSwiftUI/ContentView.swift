//
//  ContentView.swift
//  FirstSwiftUI
//
//  Created by Muhammad Fawwaz Mayda on 16/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI

struct Obj {
    public var isVisible = true
}
struct ContentView: View {
    @State var obj = Obj()
    @State var alertVisible : Bool = false
    @State var knockVisible : Bool = false
    var body: some View {
        VStack {
            
            //Target Row
            HStack {
                Text("Put the bulleye as close ad you can:")
                Text("100")

            }
            //Slider Row
            HStack {
                Text("1")
                Slider(value: .constant(57))
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
                return Alert(title: Text("Hello There"), message: Text("My First Alert"), dismissButton: .default(Text("Awesome")))
            }
        
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

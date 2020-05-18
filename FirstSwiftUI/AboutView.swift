//
//  AboutView.swift
//  FirstSwiftUI
//
//  Created by Muhammad Fawwaz Mayda on 18/05/20.
//  Copyright © 2020 Muhammad Fawwaz Mayda. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text(" 🎯 Bulls Eye 🎯")
            Text(" This is a bullseye game")
        }.navigationBarTitle(Text("About Bullseye"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

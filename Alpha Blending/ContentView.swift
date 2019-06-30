//
//  ContentView.swift
//  Alpha Blending
//
//  Created by Ryan Schumacher on 6/29/19.
//  Copyright © 2019 Ryan Schumacher. All rights reserved.
//

import SwiftUI

struct ContentView : View {

    @State var alpha: Double = 0.5
    @State var hue: Double = 0.5

    // Computed value for the Solid Color Background
    var solidColor: Color {

        // Compute the source color
        let source = UIColor(hue: CGFloat(hue),
                             saturation: 0.75,
                             brightness: 1.0,
                             alpha: 1.0)

        // Get RGB Values for the source color
        let (red, green, blue) = source.rgb

        // Get the Background Color out of the assets
        // There must be a better way to do this in SwiftUI
        let bkgColor = UIColor(named: "backgroundColor") ?? UIColor.white

        // Get RGB Values for the background color
        let (bkgRed, bkgGreen, bkgBlue) = bkgColor.rgb

        // Compute the inverse alpha for convenience.
        let inverseAlpha = 1.0 - alpha

        // Do The Math, and return the new Color
        return Color(red: red * alpha + bkgRed * inverseAlpha,
                     green: green * alpha + bkgGreen * inverseAlpha,
                     blue: blue * alpha + bkgBlue * inverseAlpha)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Alpha")
                Slider(value: $alpha,
                       from: 0.0, through: 1.0, by: 0.025)
            }.padding()

            HStack {
                Text("Hue")
                Slider(value: $hue,
                       from: 0.0, through: 1.0, by: 0.025)
            }.padding()

            HStack {
                Text("Solid Color").padding()
            }.background(solidColor)

            HStack {
                Text("Transparent Color").padding()
            }.background(Color(hue: hue, saturation: 0.75, brightness: 1.0, opacity: alpha))

        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

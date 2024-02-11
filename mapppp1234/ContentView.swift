//
//  ContentView.swift
//  mapppp1234
//
//  Created by 櫻井絵理香 on 2024/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView(searchKey: "羽田空港")
        }
    }
}

#Preview {
    ContentView()
}

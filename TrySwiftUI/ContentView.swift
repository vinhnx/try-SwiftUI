//
//  ContentView.swift
//  TrySwiftUI
//
//  Created by Vinh Nguyen on 12/09/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var query: String = ""

    var body: some View {
        VStack {
            TextField("placeholder...", text: $query).padding()
            Text(query)
                .foregroundColor(Color.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

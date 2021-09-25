//
//  ContentView.swift
//  TrySwiftUI
//
//  Created by Vinh Nguyen on 12/09/2021.
//

import SwiftUI

class MyViewModel: ObservableObject {
    @Published var output: String = ""
}

struct ContentView: View {
    @StateObject var viewModel = MyViewModel()
//    @State private var query: String = ""
//    @State private var buttonTap: Bool = false

    var body: some View {
//        Button(action: {
//            buttonTap.toggle()
//        }, label: {
//            Label("Hello", systemImage: "hand.wave")
//        })
//        .buttonStyle(.borderedProminent)
//        .buttonBorderShape(.capsule)

//        VStack {
//            Text("Hi")
//            Text("Hello")
//                .font(.largeTitle) // font for this view only
//            Text("World")
//        }
//        .font(.body) // apply body font for whole VStack

        VStack(alignment: .leading) {
            TextField("name...", text: $viewModel.output)
            Text("Hello: " + viewModel.output)
                .foregroundColor(.secondary)
        }
        .padding()

//        NavigationView {
//            List(0...100, id: \.self) { index in
//                NavigationLink {
//                    DetailView(value: "\(index)")
//                } label: {
//                    Text("\(index)")
//                }
//            }
//            .navigationTitle("Try Swiftui")
//        }
    }
}

struct DetailView: View {
    var value: String

    var body: some View {
        Text(value)
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

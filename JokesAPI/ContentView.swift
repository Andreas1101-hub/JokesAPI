//
//  ContentView.swift
//  JokesAPI
//
//  Created by Andreas Kwong on 04/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var results1: APIResult?
    @ObservedObject var apiManager = APIManager.shared
    
    var body: some View {
        Section {
            VStack {
                Text("Joke API")
                    .font(.title)
                    .padding()
                Text(results1?.joke ?? "")
                Spacer()
                Button("Generate") {
                    apiManager.fetchJoke { results in
                        results1 = results
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

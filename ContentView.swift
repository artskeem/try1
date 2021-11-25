//
//  ContentView.swift
//  Blank Template
//
//  Created by Joseph Hinkle on 9/8/20.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldRefresh = false
        var body: some View {
            VStack{
                Button(action: {
                    self.shouldRefresh.toggle()                    
                }){
                    Text("Reload")
                }
                WebView(url: nil, reload: $shouldRefresh)
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

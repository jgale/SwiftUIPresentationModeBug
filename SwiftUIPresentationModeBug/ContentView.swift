//
//  ContentView.swift
//  SwiftUIPresentationModeBug
//
//  Created by Jeremy Gale on 2020-06-03.
//  Copyright © 2020 Jeremy Gale. All rights reserved.
//

import SwiftUI

struct MySheet: View {
    @Binding var showSheet: Bool

    init(showSheet: Binding<Bool>){
        self._showSheet = showSheet
        print("init sheet")
    }

    var body: some View {
        Text("MySheet")
    }
}

struct ContentView: View {
    @State var showSheet = false
    
    // The presence of this line causes the MySheet initializer to get called twice
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            Text("Hello, World!")
            .sheet(isPresented: self.$showSheet) {
                MySheet(showSheet: self.$showSheet)
            }
            .navigationBarItems(trailing: Button(action: { self.showSheet.toggle() }) {
                Text("Show Modal")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

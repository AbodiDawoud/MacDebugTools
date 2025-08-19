//
//  SwiftUIView.swift
//  MacDebug
    

import SwiftUI

struct MacDebugExampleView: View {
    private let debug = MacDebugHelper()
    
    var body: some View {
        Form {
            Section("Debug") {
                Button("NSViewSpy", action: debug.showNSSpy)
                Button("NSDebugMenu", action: debug.addDebugMenu)
                Button("Responder Chain Panel", action: debug.showResponderChainPanel)
            }
            
            Section {
                Text("This is a Mac only view.")
                    .foregroundColor(.accentColor)
                
                Button("Click Me") { print("Clicked") }
            }
        }
        .buttonStyle(.plain)
        .formStyle(.grouped)
    }
}

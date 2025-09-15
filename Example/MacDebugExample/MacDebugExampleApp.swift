//
//  MacDebugExampleApp.swift
//  MacDebugExample
    

import SwiftUI
import MacDebug

@main
struct MacDebugExampleApp: App {
    private let helper = MacDebugHelper()
    
    var body: some Scene {
        WindowGroup {
            Form {
                Section("Debug") {
                    Button("NSViewSpy", action: helper.showNSSpy)
                    Button("NSDebugMenu", action: helper.addDebugMenu)
                    Button("Responder Chain Panel", action: helper.showResponderChainPanel)
                }
            }
            .buttonStyle(.plain)
            .formStyle(.grouped)
        }
    }
}

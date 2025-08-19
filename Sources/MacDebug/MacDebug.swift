// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


public final class MacDebugHelper {
    private let NS_SPY_PATH = "/System/Library/PrivateFrameworks/AMPDesktopUI.framework/AMPDesktopUI"
    private let NS_SPY_CLASS = "NSViewSpy"
    private let DEBUG_MENU_CLASS = "NSDebugMenu"
    private let RESPONDER_PANEL_CLASS = "NSResponderChainPanel"
    
    func showNSSpy() {
        let handler = dlopen(NS_SPY_PATH, RTLD_NOW)
        defer { dlclose(handler) }
        
        let ViewSpyPanel = NSClassFromString(NS_SPY_CLASS) as! NSWindowController.Type
        let toggleSelector = Selector(("showSpyOrToggleLock"))
        ViewSpyPanel.perform(toggleSelector)
    }
    
    @MainActor
    func addDebugMenu() {
        guard let menuBar = NSApplication.shared.mainMenu else {
            return print("Couldn't find the app menu bar, No menu item was added.")
        }
        
        let debugMenu = NSClassFromString(DEBUG_MENU_CLASS) as! NSObject.Type
        let debugMenuItem = debugMenu.value(forKey: "createDebugMenuItem") as! NSMenuItem
        debugMenuItem.identifier = .init(rawValue: "debugMenu")

        
        let alreadyExists = menuBar.items.contains {
            $0.identifier == debugMenuItem.identifier
        }
        
        if alreadyExists {
            menuBar.items = menuBar.items.filter {
                $0.identifier != debugMenuItem.identifier
            }
            
            return
        }
        
        menuBar.addItem(debugMenuItem)
    }
    
    @MainActor
    func showResponderChainPanel() {
        let panelObjectClass = NSClassFromString(RESPONDER_PANEL_CLASS) as! NSPanel.Type
        let panel = panelObjectClass.value(forKey: "sharedPanel") as! NSPanel
        panel.makeKeyAndOrderFront(nil)
    }
}

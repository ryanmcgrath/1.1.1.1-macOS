//
//  AppDelegate.swift
//  four
//
//  Created by Ryan McGrath on 12/23/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    lazy var popover: NSPopover = {
        return NSPopover()
    }()
    
    lazy var statusItem: NSStatusItem = {
        return NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    }()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        popover.behavior = .transient
        popover.appearance = NSAppearance.current
        popover.contentSize = CGSize(width: 300.0, height: 300.0)
        popover.contentViewController = ViewController()

        let statusBarIcon = Icons.statusBarIcon()
        statusBarIcon.isTemplate = true
        statusItem.button?.image = statusBarIcon
        statusItem.button?.alternateImage = statusBarIcon
        statusItem.button?.action = #selector(togglePopover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    @objc
    func togglePopover(sender: Any?) {
        if(popover.isShown) {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .minY)
        }
    }
}

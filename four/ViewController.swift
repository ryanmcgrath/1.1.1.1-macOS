//
//  ViewController.swift
//  four
//
//  Created by Ryan McGrath on 12/23/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Cocoa

class View: NSView {
    override var isFlipped: Bool {
        get { return true }
    }
}

class ViewController: NSViewController {
    let vpnManager = VPNManager()

    lazy var fourLabel: NSTextField = {
        let label = NSTextField(labelWithString: "1.1.1.1")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alignment = .center
        label.font = NSFont.boldSystemFont(ofSize: 30.0)
        return label
    }()

    lazy var toggle: JSSwitch = {
        let sw = JSSwitch(frame: CGRect(x: 118.0, y: 95.0, width: 64.0, height: 44.0))
        sw.target = self
        sw.action = #selector(toggleConnection)
        return sw
    }()

    lazy var connectionStatusLabel: NSTextField = {
        let label = NSTextField(labelWithString: "DISCONNECTED")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alignment = .center
        label.font = NSFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
    
    lazy var makeThemFeelBadForNotBeingConnectedLabel: NSTextField = {
        let label = NSTextField(labelWithString: "Your DNS queries are not private")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alignment = .center
        label.font = NSFont.systemFont(ofSize: 18.0)
        return label
    }()

    override func loadView() {
        let frame = NSRect(x: 0, y: 0, width: 300, height: 300)
        let rootView = View(frame: frame)
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(fourLabel)
        view.addSubview(toggle)
        view.addSubview(connectionStatusLabel)
        view.addSubview(makeThemFeelBadForNotBeingConnectedLabel)
        
        NSLayoutConstraint.activate([
            fourLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30.0),
            fourLabel.widthAnchor.constraint(equalToConstant: 300.0),
            fourLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            connectionStatusLabel.topAnchor.constraint(equalTo: fourLabel.bottomAnchor, constant: 120.0),
            connectionStatusLabel.widthAnchor.constraint(equalToConstant: 300.0),
            connectionStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            makeThemFeelBadForNotBeingConnectedLabel.topAnchor.constraint(equalTo: connectionStatusLabel.bottomAnchor, constant: 20.0),
            makeThemFeelBadForNotBeingConnectedLabel.widthAnchor.constraint(equalToConstant: 300.0),
            makeThemFeelBadForNotBeingConnectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    func toggleConnection() {
        vpnManager.connected = !vpnManager.connected
        
        if vpnManager.connected {
            connectionStatusLabel.stringValue = "CONNECTED"
            makeThemFeelBadForNotBeingConnectedLabel.stringValue = "Your DNS queries are now\n private and faster"
        } else {
            connectionStatusLabel.stringValue = "DISCONNECTED"
            makeThemFeelBadForNotBeingConnectedLabel.stringValue = "Your DNS queries are not private"
        }
    }
}

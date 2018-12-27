//
//  VPNManager.swift
//  four
//
//  Created by Ryan McGrath on 12/24/18.
//  Copyright © 2018 Ryan McGrath. All rights reserved.
//

import Foundation
import NetworkExtension

class VPNManager {
    fileprivate var manager = NETunnelProviderManager()
    fileprivate static let vpnDescription = "CloudFlare 1.1.1.1 DNS"
    fileprivate static let vpnServerDescription = "CloudFlare 1.1.1.1 DNS"
    fileprivate static let vpnDNS = ["1.1.1.1", "1.0.0.1", "2606:4700:4700::1111", "2606:4700:4700::1001"]

    public var connected: Bool {
        get {
            return manager.isOnDemandEnabled
        }
        
        set {
            if newValue == connected { return }
            
            update(body: { [weak self] in
                self?.manager.isEnabled = newValue
                self?.manager.isOnDemandEnabled = newValue
            }, complete: { [weak self] in
                let session = self?.manager.connection as? NETunnelProviderSession
                
                if newValue {
                    do {
                        try session?.startVPNTunnel(options: nil)
                        print("STARTED!")
                    } catch let err as NSError {
                        print("\(err.localizedDescription)")
                    }
                } else {
                    session?.stopVPNTunnel()
                }
            })
        }
    }

    init() {
        refreshManager()
    }

    func refreshManager() -> Void {
        NETunnelProviderManager.loadAllFromPreferences(completionHandler: { (managers, error) in
            if nil == error {
                if let managers = managers {
                    for manager in managers {
                        if manager.localizedDescription == VPNManager.vpnDescription {
                            self.manager = manager
                            return
                        }
                    }
                }
            }
            
            self.configureDNS()
        })
    }

    private func update(body: @escaping () -> Void, complete: @escaping () -> Void) {
        manager.loadFromPreferences { error in
            if error != nil {
                print("Load error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            body()
            
            self.manager.saveToPreferences { (error) in
                if nil != error {
                    print("vpn_connect: save error \(error!)")
                } else {
                    complete()
                }
            }
        }
    }

    private func configureDNS() {
        manager.localizedDescription = VPNManager.vpnDescription
        
        let proto = NETunnelProviderProtocol()
        proto.providerBundleIdentifier = "com.rymc.vpntunnel.provider"
        proto.serverAddress = VPNManager.vpnServerDescription
        manager.protocolConfiguration = proto
        
        let evaluationRule = NEEvaluateConnectionRule(matchDomains: TLDS, andAction: .connectIfNeeded)
        evaluationRule.useDNSServers = VPNManager.vpnDNS
        
        let onDemandRule = NEOnDemandRuleEvaluateConnection()
        onDemandRule.connectionRules = [evaluationRule]
        onDemandRule.interfaceTypeMatch = .any
        
        manager.onDemandRules = [onDemandRule]
    }
}

// AirPlayBrowser.swift
import Foundation

class AirPlayBrowser: NSObject, NetServiceBrowserDelegate {
    private let netServiceBrowser = NetServiceBrowser()

    override init() {
        super.init()
        netServiceBrowser.delegate = self
        netServiceBrowser.searchForServices(ofType: "_airplay._tcp", inDomain: "local.")
    }

    func netServiceBrowser(_ browser: NetServiceBrowser, didFind service: NetService, moreComing: Bool) {
    if !service.name.contains("Mac") {
    print("\(service.name)")
    }
        if !moreComing {
            netServiceBrowser.stop()
            exit(0)
        }
    }

    func netServiceBrowser(_ browser: NetServiceBrowser, didNotSearch errorDict: [String : NSNumber]) {
        print("Search not successful: \(errorDict)")
    }
}

let airPlayBrowser = AirPlayBrowser()
RunLoop.main.run()
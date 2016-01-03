import WatchKit
import WatchConnectivity
import Foundation

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var reachabilityStatusLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.

        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        if WCSession.isSupported() {
            sessionReachabilityDidChange(WCSession.defaultSession())
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func sessionReachabilityDidChange(session: WCSession) {
        if session.reachable {
            reachabilityStatusLabel.setText("Reachable")
        } else {
            if session.iOSDeviceNeedsUnlockAfterRebootForReachability {
                reachabilityStatusLabel.setText("iPhone is locked")
            } else {
                reachabilityStatusLabel.setText("Unreachable")
            }
        }
    }
}

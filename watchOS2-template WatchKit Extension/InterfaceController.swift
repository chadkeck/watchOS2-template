import ClockKit
import WatchKit
import WatchConnectivity
import Foundation

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var reachabilityStatusLabel: WKInterfaceLabel!
    @IBOutlet var complicationCountLabel: WKInterfaceLabel!

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

        updateActiveComplicationsCount()
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

    @IBAction func onResetComplicationsTapped() {
        reloadComplicationTimelines()
    }

    private func reloadComplicationTimelines() {
        let complicationServer = CLKComplicationServer.sharedInstance()
        complicationServer.activeComplications.forEach { (complication) -> Void in
            complicationServer.reloadTimelineForComplication(complication)
        }
    }

    private func updateActiveComplicationsCount() {
        let countString = "\(CLKComplicationServer.sharedInstance().activeComplications.count)"
        complicationCountLabel.setText(countString)
    }
}

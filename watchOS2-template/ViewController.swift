import UIKit
import WatchConnectivity

class ViewController: UITableViewController, WCSessionDelegate {
    var isWatchAppInstalled = false
    var isPaired = false
    var isComplicationEnabled = false
    var isReachable = false
    var watchDirectoryURL: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // remove extra empty cells at bottom of table
        self.tableView.tableFooterView = UIView()

        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if WCSession.isSupported() {
            let session = WCSession.defaultSession()
            sessionWatchStateDidChange(session)
            sessionReachabilityDidChange(session)
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    func sessionWatchStateDidChange(session: WCSession) {
        isPaired = session.paired

        isWatchAppInstalled = session.watchAppInstalled
        isComplicationEnabled = session.complicationEnabled
        watchDirectoryURL = session.watchDirectoryURL

        tableView.reloadData()
    }

    func sessionReachabilityDidChange(session: WCSession) {
        isReachable = session.reachable

        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
                cell.textLabel?.text = "Paired with Apple Watch?"
                cell.detailTextLabel?.text = isPaired ? "Yes" : "No"
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
                cell.textLabel?.text = "Installed?"
                cell.detailTextLabel?.text = isWatchAppInstalled ? "Yes" : "No"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
                cell.textLabel?.text = "Reachable?"
                cell.detailTextLabel?.text = isReachable ? "Yes" : "No"
                return cell
            case 3:
                let cell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
                cell.textLabel?.text = "Complication"
                cell.detailTextLabel?.text = isComplicationEnabled ? "Enabled" : "Disabled"
                return cell
            case 4:
                let cell = tableView.dequeueReusableCellWithIdentifier("DetailCell", forIndexPath: indexPath)
                cell.textLabel?.text = "Watch Directory"
                cell.detailTextLabel?.text = watchDirectoryURL?.absoluteString
                return cell
            default:
                let cell = tableView.dequeueReusableCellWithIdentifier("StatusCell", forIndexPath: indexPath)
                cell.textLabel?.text = nil
                cell.detailTextLabel?.text = nil
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
}
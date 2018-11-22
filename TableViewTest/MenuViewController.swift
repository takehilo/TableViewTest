import UIKit
class MenuTableViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = storyboard.instantiateViewController(withIdentifier: "SimpleTableViewController")
        case 1:
            vc = storyboard.instantiateViewController(withIdentifier: "EditTableViewController")
        case 2:
            vc = storyboard.instantiateViewController(withIdentifier: "BatchDeletionTableViewController")
        case 3:
            vc = storyboard.instantiateViewController(withIdentifier: "SwipeActionTableViewController")
        default:
            return
        }

        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

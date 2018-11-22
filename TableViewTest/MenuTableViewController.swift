import UIKit

class MenuViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = storyboard.instantiateViewController(withIdentifier: "SimpleViewController")
        case 1:
            vc = storyboard.instantiateViewController(withIdentifier: "EditViewController")
        case 2:
            vc = storyboard.instantiateViewController(withIdentifier: "BatchTableViewController")
        case 3:
            vc = storyboard.instantiateViewController(withIdentifier: "SwipeActionViewController")
        default:
            return
        }

        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

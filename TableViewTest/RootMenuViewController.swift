import UIKit

class RootMenuViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = storyboard.instantiateViewController(withIdentifier: "MenuTableViewController")
        case 1:
            vc = storyboard.instantiateViewController(withIdentifier: "MenuTableViewController")
        default:
            return
        }

        present(UINavigationController(rootViewController: vc), animated: true)
    }

}

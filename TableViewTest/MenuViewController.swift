import UIKit

class MenuViewController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = storyboard.instantiateViewController(withIdentifier: "ViewController1")
        case 1:
            vc = storyboard.instantiateViewController(withIdentifier: "ViewController2")
        case 2:
            vc = storyboard.instantiateViewController(withIdentifier: "ViewController3")
        case 3:
            vc = storyboard.instantiateViewController(withIdentifier: "ViewController4")
        default:
            return
        }

        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

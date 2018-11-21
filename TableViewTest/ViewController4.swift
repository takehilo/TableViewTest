import UIKit

// スワイプ
class ViewController4: UITableViewController {
    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefreshed(sender:)), for: .valueChanged)
    }
    
    @objc
    func back() {
        dismiss(animated: true)
    }

    @objc
    func onRefreshed(sender: UIRefreshControl) {
        tableView.reloadData()
        sender.endRefreshing()
    }
}

// DataSourde
extension ViewController4 {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
}

// Delegate
extension ViewController4 {
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "追加") { (action, view, completion) in
            self.texts.insert("Boo", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .green

        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (action, view, completion) in
            self.texts.remove(at: indexPath.row)
            completion(true)
        }
        action.backgroundColor = .red

        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }
}

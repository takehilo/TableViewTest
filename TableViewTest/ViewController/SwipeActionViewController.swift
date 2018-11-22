import UIKit

// スワイプ
class SwipeActionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        navigationItem.title = "SwipeActionTableViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(onRefreshed(sender:)), for: .valueChanged)
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
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
extension SwipeActionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
}

// Delegate
extension SwipeActionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "追加") { (action, view, completion) in
            self.texts.insert("Boo", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .green

        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (action, view, completion) in
            self.texts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .red

        let config = UISwipeActionsConfiguration(actions: [action])
        return config
    }
}

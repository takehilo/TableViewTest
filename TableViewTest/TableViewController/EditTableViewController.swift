import UIKit

// 編集モードと左スワイプ削除
class EditTableViewController: UITableViewController {
    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "EditTableViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = editButtonItem
    }

    @objc
    func back() {
        dismiss(animated: true)
    }
}

// DataSourde
extension EditTableViewController {
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
extension EditTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row % 3 == 0 {
            return .delete
        } else if indexPath.row % 3 == 1 {
            return .insert
        } else {
            return .none
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("delete")
            texts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .insert:
            print("insert")
            texts.insert("Boo", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .automatic)
        case .none:
            print("none")
        }
    }

    override func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        print("willBeginEdtingRowAt")
    }

    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        print("didEndEdtingRowAt")
    }
}

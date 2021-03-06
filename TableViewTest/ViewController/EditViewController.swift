import UIKit

// 編集モードと左スワイプ削除
class EditViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        navigationItem.title = "EditViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = editButtonItem
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }

    @objc
    func back() {
        dismiss(animated: true)
    }
}

// DataSourde
extension EditViewController: UITableViewDataSource {
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
extension EditViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row % 3 == 0 {
            return .delete
        } else if indexPath.row % 3 == 1 {
            return .insert
        } else {
            return .none
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        print("willBeginEdtingRowAt")
    }

    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        print("didEndEdtingRowAt")
    }
}

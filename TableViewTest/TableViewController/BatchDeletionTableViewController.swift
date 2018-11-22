import UIKit

// 一括削除
class BatchDeletionTableViewController: UITableViewController {
    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "BatchDeletionTableViewController"
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back)),
            UIBarButtonItem(title: "削除", style: .plain, target: self, action: #selector(deleteRows))
        ]
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @objc
    func back() {
        dismiss(animated: true)
    }

    @objc
    func deleteRows() {
        guard let indexPaths = tableView.indexPathsForSelectedRows else { return }

        tableView.beginUpdates()

        let indices = indexPaths.map { $0.row }.sorted(by: { $0 > $1 })
        indices.forEach { texts.remove(at: $0) }

        tableView.deleteRows(at: indexPaths, with: .automatic)

        tableView.endUpdates()
    }
}

// DataSourde
extension BatchDeletionTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
}

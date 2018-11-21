import UIKit

class ViewController1: UITableViewController {
    var texts = ["Hello", "World", "Hoge", "Foo", "Bar", "Baz"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = editButtonItem
    }

    @objc
    func back() {
        dismiss(animated: true)
    }
}

// DataSourde
extension ViewController1 {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = texts[indexPath.row]
        return cell
    }
}



import UIKit

enum MenuType : Int {
    case home
    case days
    case category
    case edit
}

class MenuViewController: UITableViewController {
    
    var didTapMenuType : ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("선택카테고리:\(menuType)")
            self?.didTapMenuType?(menuType)
            
            }
    }

}

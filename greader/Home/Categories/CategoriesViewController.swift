//  Copyright © 2019 Lohan Marques. All rights reserved.

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var articlesTableView: UIView!
    
    // MARK: VARIABLES
    var articles: [Article] = []
    var category: Category!
}

// MARK: LIFECYCLE
extension CategoriesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = category.name
        navigationController?.customizeBackButton()
        
        applyColorForCategory()
    }
}

// MARK: TABLEVIEW
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ArticleCell.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return articles[indexPath.row].instantiateCell(tableView, indexPath: indexPath)
    }
}

// MARK: METHODS
extension CategoriesViewController {
    
    func applyColorForCategory() {
        if let colorName = category.color, let color = UIColor(named: colorName) {
            navigationController?.navigationBar.tintColor = color
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : color
            ]
        }
    }
}

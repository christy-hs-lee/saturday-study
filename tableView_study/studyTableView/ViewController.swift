//
//  ViewController.swift
//  studyTableView
//
//  Created by Hyejeong Jeong on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    enum FoodType: String {
        case American = "양식"
        case Chinese = "중식"
        case Korean = "한식"
        case Japanese = "일식"
    }

    struct Food {
        let name: String
        var price: Int
    }
    
    @IBOutlet weak var tableView: UITableView!
    let customCellIdentifier: String = "customCell"
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }

}

// MARK: - table view data source
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return menu[.American]?.count ?? 0
        case 1:
            return menu[.Chinese]?.count ?? 0
        case 2:
            return menu[.Korean]?.count ?? 0
        case 3:
            return menu[.Japanese]?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return FoodType.American.rawValue
        case 1:
            return FoodType.Chinese.rawValue
        case 2:
            return FoodType.Korean.rawValue
        case 3:
            return FoodType.Japanese.rawValue
        default:
            return "empty"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.customCellIdentifier, for: indexPath) as! CustomTableViewCell

        switch indexPath.section {
        case 0:
            cell.foodLabel.text = menu[.American]?[indexPath.row].name
            cell.priceLabel.text = String((menu[.American]?[indexPath.row].price ?? 0)) + "원"
        case 1:
            cell.foodLabel.text = menu[.Chinese]?[indexPath.row].name
            cell.priceLabel.text = String((menu[.Chinese]?[indexPath.row].price ?? 0)) + "원"
        case 2:
            cell.foodLabel.text = menu[.Korean]?[indexPath.row].name
            cell.priceLabel.text = String((menu[.Korean]?[indexPath.row].price ?? 0)) + "원"
        case 3:
            cell.foodLabel.text = menu[.Japanese]?[indexPath.row].name
            cell.priceLabel.text = String((menu[.Japanese]?[indexPath.row].price ?? 0)) + "원"
        default:
            cell.foodLabel.text = "empty"
        }
        return cell
    }
}

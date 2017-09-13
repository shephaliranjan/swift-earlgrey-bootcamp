//
//  Step2TableViewController.swift
//  swift-earlgrey-bootcamp
//
//  Created by Pivotal on 2017-05-08.
//
//

import UIKit

class Step2TableViewController: UITableViewController {

    // MARK: Properties
    var content = [String]()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCellContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Step2TableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Step2TableViewCell else {
            fatalError("The dequeued cell is not an instance of Step2TableViewCell")
        }
        
        let cellContent = content[indexPath.row]
        cell.step2Label.text = cellContent
        
        return cell
    }
    
    // MARK: Private Methods
    private func loadCellContent() {
        for number in 1...50 {
            content += ["\(number)"]
        }
    }

}

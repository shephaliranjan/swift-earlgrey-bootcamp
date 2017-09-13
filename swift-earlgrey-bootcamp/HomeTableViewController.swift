//
//  HomeTableViewController.swift
//  swift-earlgrey-bootcamp
//
//  Created by Pivotal on 2017-05-08.
//
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // MARK: Properties
    var stepsCells = [String]()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepsCells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HomeTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of HomeTableViewCell")
        }
        
        let step = stepsCells[indexPath.row]
        cell.homeLabel.text = step
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "Step1", sender: self)
            break
        case 1:
            self.performSegue(withIdentifier: "Step2", sender: self)
            break
        case 2:
            self.performSegue(withIdentifier: "Step3", sender: self)
            break
        case 3:
            self.performSegue(withIdentifier: "Step4", sender: self)
            break
        case 4:
            self.performSegue(withIdentifier: "Step5", sender: self)
            break
        default:
            break
        }
    }
    
    // MARK: Private Methods
    private func loadSteps() {
        stepsCells += ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"]
    }
    
}

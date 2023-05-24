//
//  PlantListViewController.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 24/05/2023.
//

import UIKit

class PlantListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }
}

extension PlantListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "pinkCell", for: indexPath)

        // Customize
        var config = cell.defaultContentConfiguration()
        config.text = "Test"
        config.textProperties.color = UIColor.blue

        config.secondaryText = "Secondary"
        config.secondaryTextProperties.font = UIFont.boldSystemFont(ofSize: 20)

        config.image = UIImage(systemName: "leaf")

        cell.contentConfiguration = config

        return cell
    }
}



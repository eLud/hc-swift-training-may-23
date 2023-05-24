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
        
        return cell
    }
}



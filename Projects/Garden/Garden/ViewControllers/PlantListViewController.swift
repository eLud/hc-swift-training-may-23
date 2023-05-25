//
//  PlantListViewController.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 24/05/2023.
//

import UIKit

class PlantListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let garden = Garden(name: "Potager", plants: [Plant(name: "Tomate", price: 3.99, numberOfSeeds: 3, climate: .shadow), Plant(name: "Courgette", price: 4.99, numberOfSeeds: 2, climate: .sun)])

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

        let notCenter = NotificationCenter.default
        notCenter.addObserver(forName: Notification.Name(Constants.Notifications.modelUpdated), object: garden, queue: OperationQueue.main) { _ in
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlantDetails" {
            guard let destination = segue.destination as? PlantDetailsViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            
            let plant = garden.plants[indexPath.row]
            destination.plant = plant

            // Ne jamais accéder aux outlets de la destination dans un prepare for segue
//            destination.plantNameLabel.text = "Toto"
        } else if segue.identifier == "showForm" {
            guard let destination = segue.destination as? ViewController else { return }
            destination.garden = garden
        }
    }
}

extension PlantListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { return 0 }
        return garden.plants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "pinkCell", for: indexPath)

        let plant = garden.plants[indexPath.row]

        // Customize
        var config = cell.defaultContentConfiguration()
        config.text = plant.name
//        config.textProperties.color = UIColor.blue

        config.secondaryText = plant.climate?.title()
//        config.secondaryTextProperties.font = UIFont.boldSystemFont(ofSize: 20)

        config.image = UIImage(systemName: "leaf")

        cell.contentConfiguration = config

        return cell
    }
}



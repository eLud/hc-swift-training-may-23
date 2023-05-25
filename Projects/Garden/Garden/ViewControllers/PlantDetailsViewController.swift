//
//  PlantDetailsViewController.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 25/05/2023.
//

import UIKit

class PlantDetailsViewController: UIViewController {

    var plant: Plant?

    @IBOutlet weak var plantNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let plant else { fatalError("Plant not provided") }
        plantNameLabel.text = plant.name
        title = plant.name
    }
}

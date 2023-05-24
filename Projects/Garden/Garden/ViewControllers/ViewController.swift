//
//  ViewController.swift
//  Garden
//
//  Created by Ludovic Ollagnier on 23/05/2023.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet : var qui référence un élément de l'UI
    @IBOutlet weak var climateSegmentedControl: UISegmentedControl!

    @IBOutlet weak var plantNameTextField: UITextField!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var numberOfSeedsStepper: UIStepper!
    @IBOutlet weak var numberOfSeedsControlLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!

    var selectedChoice: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
    }

    private func configureUI() {
        configurePopupMenu()
        configureSegmentedControl()
    }

    private func configureSegmentedControl() {
        let climates = Climate.allCases
        climateSegmentedControl.removeAllSegments()

        var tab: [UIAction] = []

        for climate in climates {
            let index = climateSegmentedControl.numberOfSegments
            climateSegmentedControl.insertSegment(withTitle: climate.title(), at: index , animated: false)
            let action = UIAction(title: climate.title(),handler: { _ in
                self.selectedChoice = climate.title()
            })
            tab.append(action)
        }
        climateSegmentedControl.selectedSegmentIndex = 0
    }

    private func configurePopupMenu() {
        let menu = UIMenu(title: "Submenu", children: [
            UIAction(title: "Choice 1",handler: { _ in
                self.selectedChoice = "1"
            }),
            UIAction(title: "Choice 2",handler: { _ in
                self.selectedChoice = "2"
            })
            ])

        menuButton.menu = UIMenu(children: [
            UIAction(title: "Choice 1",handler: { _ in
                self.selectedChoice = "1"
            }),
            UIAction(title: "Choice 2",handler: { _ in
                self.selectedChoice = "2"
            }),
            menu
        ])
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.changesSelectionAsPrimaryAction = true
    }

    // IBAction : func qui s'execute en fct de l'UI

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("Changed")
    }

    @IBAction func savePlant(_ sender: UIButton) {

        guard let name = plantNameTextField.text, !name.isEmpty else { return }
        guard let priceString = priceTextField.text, let price = Double(priceString)  else { return }

        let index = climateSegmentedControl.selectedSegmentIndex
        let climate = Climate(rawValue: index)

        let plant = Plant(name: name, price: price, numberOfSeeds: Int(numberOfSeedsStepper.value), climate: climate)
    }
}


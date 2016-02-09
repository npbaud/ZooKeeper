//
//  DetailViewController.swift
//  ZooKeeper
//
//  Created by Nicholas Baud on 2/4/16.
//  Copyright © 2016 Nicholas Baud. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var legTextField: UITextField!
    @IBOutlet weak var isMaleSwitch: UISwitch!
    
    
    var detailItem: Animal? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let animal = self.detailItem {
                nameTextView?.text = animal.name
                colorTextField?.text = animal.color
                legTextField?.text = "\(animal.legCount ?? 0)"
                isMaleSwitch?.on = animal.isMale
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


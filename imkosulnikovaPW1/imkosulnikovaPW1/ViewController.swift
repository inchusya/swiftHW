//
//  ViewController.swift
//  imkosulnikovaPW1
//
//  Created by Inna Kosulnikova on 03.10.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonWasPressed(_ sender: Any) {
        view1.backgroundColor = UIColor(
         displayP3Red: .random(in: 0...1),
         green: .random(in: 0...1),
         blue: .random(in: 0...1),
         alpha: 1
        )
        
    }
    @IBAction func buttonWasPressed2(_ sender: Any) {
        view2.backgroundColor = UIColor(
         displayP3Red: .random(in: 0...1),
         green: .random(in: 0...1),
         blue: .random(in: 0...1),
         alpha: 1
        )
    }
   
    @IBAction func buttonWasPressed3(_ sender: Any) {
        view3.backgroundColor = UIColor(
         displayP3Red: .random(in: 0...1),
         green: .random(in: 0...1),
         blue: .random(in: 0...1),
         alpha: 1
        )
    }
    
    
    @IBAction func cornerRadius(_ sender: Any) {
        view1.layer.cornerRadius = .random(in: 0...25)
    }
    @IBAction func cornerRadius2(_ sender: Any) {
        view1.layer.cornerRadius = .random(in: 0...25)
    }
    
    @IBAction func cornerRadius3(_ sender: Any) {
        view3.layer.cornerRadius = .random(in: 0...25)
    }
}

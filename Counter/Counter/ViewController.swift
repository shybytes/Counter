//
//  ViewController.swift
//  Counter
//
//  Created by Maxim Riaguzov on 26.03.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet private weak var result: UILabel!
    @IBOutlet private weak var increase: UIButton!
    @IBOutlet private weak var decrease: UIButton!
    @IBOutlet private weak var nullify: UIButton!
    @IBOutlet weak var history: UITextView!
    
    private var counter: UInt = 0
    
    let date = Date().formatted()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = String(counter)
        
        history.text = "История изменений:\n"
    }
    
    @IBAction func increase(_ sender: Any) {
        counter += 1
        result.text = "Значение счётчика: " + String(counter)
        let event = "\(date): значение изменено на +1\n"
        history.text.append(event)
    }

    @IBAction func decrease(_ sender: Any) {
        if counter != 0 {
            counter -= 1
            let event = "\(date): значение изменено на -1\n"
            history.text.append(event)
        } else {
            counter = 0
            let event = "\(date): попытка уменьшить значение счётчика ниже 0\n"
            history.text.append(event)
        }
        
        result.text = "Значение счётчика: " + String(counter)
    }
    
    
    @IBAction func nullify(_ sender: Any) {
        counter = 0
        result.text = String(counter)
        
        let event = "\(date): значение сброшено\n"
        history.text.append(event)
    }
    
}



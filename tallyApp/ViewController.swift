//
//  ViewController.swift
//  tallyApp
//
//  Created by Deseret Baker on 3/6/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var intervalPickerView: UIPickerView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var count = 0
    let intervalOptions = Array(1...10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intervalPickerView.delegate = self
        intervalPickerView.dataSource = self
        
        countLabel.text = "\(count)"
        
        plusButton.setTitle("PLUS", for: .normal)
        plusButton.setTitleColor(.blue, for: .normal)
        plusButton.addTarget(self, action: #selector(increaseCount), for: .touchUpInside)
        
        minusButton.setTitle("MINUS", for: .normal)
        minusButton.setTitleColor(.systemPink, for: .normal)
        minusButton.addTarget(self, action: #selector(decreaseCount), for: .touchUpInside)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return intervalOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(intervalOptions[row])"
    }
    
    // MARK: - Action Methods
    
    @objc func increaseCount() {
        let selectedInterval = intervalOptions[intervalPickerView.selectedRow(inComponent: 0)]
        count += selectedInterval
        updateCountLabel()
    }
    
    @objc func decreaseCount() {
        if count > 0 {
            let selectedInterval = intervalOptions[intervalPickerView.selectedRow(inComponent: 0)]
            count -= selectedInterval
            updateCountLabel()
        }
    }
    
    func updateCountLabel() {
        countLabel.text = "\(count)"
    }
}

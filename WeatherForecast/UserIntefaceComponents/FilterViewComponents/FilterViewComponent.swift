//
//  FilterViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class FilterViewComponent: GenericBaseView<FilterViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [cityText, dailyCount])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var cityText: TextFieldContainer = {
        let temp = TextFieldContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var dailyCount: TextFieldContainer = {
        let temp = TextFieldContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textField.inputView = pickerView
        return temp
    }()
    
    lazy var pickerView: UIPickerView = {
        let temp = UIPickerView()
        temp.delegate = self
        temp.dataSource = self
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() else { return }
        cityText.setData(data: data.cityTextData)
        dailyCount.setData(data: data.dailyCountData)
    }
    
    func getTextValues() -> (String, Int) {
        guard let count = dailyCount.textField.text else { return ("istanbul", 16)}
        return (cityText.textField.text ?? "istanbul", Int(count) ?? 16)
    }
    
}

// Mark: - UIPickerViewDelegate -
extension FilterViewComponent: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let data = returnData() else { return 16 }
        return data.pickerCount
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dailyCount.textField.text = "\(row + 1)"
    }
    
}

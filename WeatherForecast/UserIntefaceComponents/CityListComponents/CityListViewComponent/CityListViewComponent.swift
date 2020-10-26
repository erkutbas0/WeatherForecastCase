//
//  CityListViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class CityListViewComponent: GenericBaseView<CityListViewComponentData> {
    
    private weak var delegate: CityListViewComponentDelegate?
    
    private lazy var cityListTableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.rowHeight = UITableView.automaticDimension
        temp.estimatedRowHeight = 300
        
        temp.delegate = self
        temp.dataSource = self
        
        temp.genericRegister(CityWeatherInfoCell.self)
        
        return temp
        
    }()
    
    private func listenSelectedRow(_ data: GenericRowDataProtocol) {
        print("data : \(data.itemId)")
    }
    
}

// Mark: - UITableViewDelegate, UITableViewDataSource -
extension CityListViewComponent: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.getNumberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.getNumberOfItems(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.getCityItem(by: indexPath.row) else { fatalError("Please register required cell") }
        
        guard let cell = cityListTableView.genericDequeCell(indexPath: indexPath) as? CityWeatherInfoCell else { fatalError() }
        
        cell.setRowData(data: data)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CityWeatherInfoCell else { return }
        cell.subscribeToSelectedRow(completion: listenSelectedRow(_:))
    }
    
    
}

//
//  CityListViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

typealias SelectedCityCompletion = (Int64) -> Void
typealias RemovedCityCompletion = (Int64) -> Void

class CityListViewComponent: GenericBaseView<CityListViewComponentData> {
    
    private weak var delegate: CityListViewComponentDelegate?
    private var selectedCity: SelectedCityCompletion?
    private var removedCity: RemovedCityCompletion?
    
    private lazy var cityListTableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.separatorStyle = .none
        temp.delegate = self
        temp.dataSource = self
        temp.rowHeight = 110
        temp.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        temp.setContentOffset(CGPoint(x: 0, y: -20), animated: false)
        temp.genericRegister(CityWeatherInfoCell.self)
        return temp
        
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addTableView()
    }
    
    private func addTableView() {
        addSubview(cityListTableView)
        
        NSLayoutConstraint.activate([
            
            cityListTableView.topAnchor.constraint(equalTo: topAnchor),
            cityListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cityListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cityListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
    
    private func listenSelectedRow(_ data: GenericRowDataProtocol) {
        selectedCity?(data.itemId)
    }
    
    private func setRemovedCity(_ data: GenericRowDataProtocol?) {
        guard let data = data else { return }
        removedCity?(data.itemId)
    }
    
    func subscribeSelectedCity(completion: @escaping SelectedCityCompletion) {
        selectedCity = completion
    }
    
    func subscribeRemovedCity(completion: @escaping RemovedCityCompletion) {
        removedCity = completion
    }
    
    func setDelegate(_ delegate: CityListViewComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadComponent() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) {
                self.cityListTableView.reloadData()
            }
        }
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherInfoCell.identifier, for: indexPath) as? CityWeatherInfoCell else { fatalError() }
        cell.setRowData(data: data)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CityWeatherInfoCell else { return }
        cell.subscribeToSelectedRow(completion: listenSelectedRow(_:))
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CityWeatherInfoCell else { return }
        
        if editingStyle == .delete {
            setRemovedCity(cell.returnGenericRowData())
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

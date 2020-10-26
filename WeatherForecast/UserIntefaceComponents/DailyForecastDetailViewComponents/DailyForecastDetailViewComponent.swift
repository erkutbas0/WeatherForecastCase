//
//  DailyForecastDetailViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DailyForecastDetailViewComponent: GenericBaseView<DailyForecastDetailViewComponentData> {
    
    private var headerView: DetailHeaderViewComponent!
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.delegate = self
        temp.dataSource = self
        
        temp.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        //temp.scrollIndicatorInsets = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
        
        temp.register(DailyForecastDetailViewCell.self, forCellReuseIdentifier: DailyForecastDetailViewCell.identifier)
        
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        setupTableViewConfigurations()
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addDetailTableView()
        addHeaderView()
        
    }
    
    private func addDetailTableView() {
        addSubview(tableView)
    
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
        
    }
    
    private func setupTableViewConfigurations() {
        tableView.setContentOffset(CGPoint(x: 0, y: -200), animated: false)
    }
    
    private func addHeaderView() {
        headerView = DetailHeaderViewComponent()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerView)
    
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }
    
}

extension DailyForecastDetailViewComponent: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastDetailViewCell.identifier, for: indexPath) as? DailyForecastDetailViewCell else { fatalError() }
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
}

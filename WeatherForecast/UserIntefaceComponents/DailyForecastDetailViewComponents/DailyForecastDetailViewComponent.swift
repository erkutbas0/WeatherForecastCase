//
//  DailyForecastDetailViewComponent.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import UIKit

class DailyForecastDetailViewComponent: GenericBaseView<DailyForecastDetailViewComponentData> {
    
    private var headerView: DetailHeaderViewComponent!
    private var headerViewHeightConstraint = NSLayoutConstraint()
    private var headerViewInitialHeight: CGFloat = 300

    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        
        temp.delegate = self
        temp.dataSource = self
        
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
        guard let data = returnData() else { return }
        tableView.contentInset = UIEdgeInsets(top: data.headerHeight, left: 0, bottom: 0, right: 0)
        tableView.setContentOffset(CGPoint(x: 0, y: -data.headerHeight), animated: false)
        headerViewInitialHeight = data.headerHeight
    }
    
    private func addHeaderView() {
        guard let data = returnData() else { return }
        headerView = DetailHeaderViewComponent(data: data.headerViewData)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerView)
        
        headerViewHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: data.headerHeight)
    
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerViewHeightConstraint
        
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

// MARK: - UIScrollViewDelegate
extension DailyForecastDetailViewComponent: UIScrollViewDelegate {
    
    private func headerViewHeightManager(scrollViewContentOffset_Y: CGFloat, height: CGFloat) {
        
        if scrollViewContentOffset_Y <= -headerViewInitialHeight {
            headerViewHeightConstraint.constant = headerViewInitialHeight
        } else {
            headerViewHeightConstraint.constant = height
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let y = headerViewInitialHeight - (scrollView.contentOffset.y + headerViewInitialHeight)
        let height = min(max(y, 100), UIScreen.main.bounds.height)
        
        headerViewHeightManager(scrollViewContentOffset_Y: scrollView.contentOffset.y, height: height)
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // to do
    }
}

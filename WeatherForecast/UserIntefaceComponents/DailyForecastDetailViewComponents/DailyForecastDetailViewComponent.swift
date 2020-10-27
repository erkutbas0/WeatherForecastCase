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
    private var headerViewInitialHeight: CGFloat = 340
    
    private weak var delegate: DailyForecastDetailViewComponentDelegate?

    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.separatorStyle = .none
        temp.delegate = self
        temp.dataSource = self
        temp.tableFooterView = UIView()
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
    
    func setDelegate(delegate: DailyForecastDetailViewComponentDelegate?) {
        self.delegate = delegate
    }
    
}

// Mark: - UITableViewDelegate, UITableViewDataSource -
extension DailyForecastDetailViewComponent: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.numberOfItems(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = delegate?.getItemData(at: indexPath.row) else { fatalError() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastDetailViewCell.identifier, for: indexPath) as? DailyForecastDetailViewCell else { fatalError() }
        
        cell.setRowData(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

// MARK: - UIScrollViewDelegate
extension DailyForecastDetailViewComponent: UIScrollViewDelegate {
    
    private func headerViewHeightManager(scrollViewContentOffset_Y: CGFloat, height: CGFloat) {
        
        if scrollViewContentOffset_Y <= -headerViewInitialHeight {
            headerViewHeightConstraint.constant = headerViewInitialHeight
            headerView.headerBottomInfo.partActivationManager(active: true)
        } else {
            headerViewHeightConstraint.constant = height
            headerView.headerBottomInfo.partActivationManager(active: false)
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

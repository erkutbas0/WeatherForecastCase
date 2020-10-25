//
//  BaseView.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import UIKit

public class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorFields()
        setupViews()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorFields()
        setupViews()
    }
    
    func addMajorFields() {}
    func setupViews() {}
    
}

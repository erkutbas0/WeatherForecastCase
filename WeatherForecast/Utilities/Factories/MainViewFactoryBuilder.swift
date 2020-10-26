//
//  MainViewFactoryBuilder.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 26.10.2020.
//

import Foundation

class MainViewFactoryBuilder: MainViewFactoryBuilderInterface {

    func returnHeaderViewComponentData() -> HeaderViewComponentData {
        return HeaderViewComponentData(title: BasicAttributedLabelData(text: MainViewLocalizables.headerTitle.value).setTextFont(with: [SourceSansPro.SemiBold(40).value])).setRightIcon(by: ImageContainerData().setImage(with: VisualContents.searchIcon.value).setWidth(with: 40).setHeight(with: 40))
    }
    
}

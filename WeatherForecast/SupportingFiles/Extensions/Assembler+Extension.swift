//
//  Assembler+Extension.swift
//  WeatherForecast
//
//  Created by Erkut Bas on 24.10.2020.
//


import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembler: Assembler = {
       
        let container = Container()
        
        let assembler = Assembler([CoordinatorsAssembly(),
                                   ManagerAssembly(),
                                   ViewModelsAssembly(),
                                   RepositoryAssembly(),
                                   RemoteAssembly(),
                                   UseCaseAssembly(),
                                   FormatterAssembly(),
                                   ApiServiceAssembly(),
                                   FactoryAssembly()],
                                  container: container)
        return assembler
        
    }()
    
}

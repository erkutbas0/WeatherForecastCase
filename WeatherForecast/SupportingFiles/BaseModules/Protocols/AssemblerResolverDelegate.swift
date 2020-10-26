//
//  AssemblerResolverDelegate.swift
//  WeatherForeCast
//
//  Created by Erkut Bas on 24.10.2020.
//

import Swinject

protocol AssemblerResolverDelegate {
    
}

extension AssemblerResolverDelegate {
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}

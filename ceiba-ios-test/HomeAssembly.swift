//
//  HomeAssembly.swift
//  ceiba-ios-test
//
//  Created by Juan Martin Huerta Hernandez on 13/09/21.
//

import UIKit

class HomeAssembly {
    static func buildNavigation(usingNavigationFactory factory: NavigationFactory) ->  UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        let interator = HomeInteractor();
        let router = HomeRouter(view: view)
        let presenter = HomePresenter(view: view, interactor: interator, router: router)
        view.presenter = presenter;
        
        return factory(view)
    }
}

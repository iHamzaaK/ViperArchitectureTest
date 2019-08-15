//
//  AppRouter.swift
//  DriveRecords
//
//  Created by Hamza Khan on 05/08/2019.
//  Copyright © 2019 Hamza Khan. All rights reserved.
//

import Foundation
import UIKit
class AppRouter: BaseRouter {
    func createRoute() {
        let dashboardVC = DashboardRouter.createModule()
        navigationController.viewControllers = [dashboardVC]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private weak var window : UIWindow?
    private var navigationController : UINavigationController!
    
    init(_ window : UIWindow) {
//        super.init()
        self.window = window
        navigationController = UINavigationController()
    }
  
    
}

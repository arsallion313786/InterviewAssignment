//
//  AppCoordinator.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
import UIKit

final class AppCoordinator:BaseCoordinator{
    
    
    
    // App UI entry Point
    override func start() {
        
        let childCoordinator = ArticleListViewCoordinator(router: self.router)
        childCoordinator.start();
        self.addDependency(childCoordinator)
    }
    
}

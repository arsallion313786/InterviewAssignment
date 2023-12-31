//
//  BaseCoordinator.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
class BaseCoordinator: Coordinator {
    
    // MARK: - Vars & Lets
    
    var childCoordinators = [Coordinator]()
    let router: RouterProtocol
    
    
    //MARK: - init
    init(router: RouterProtocol) {
        self.router = router;
    }
    
    // MARK: - Public methods
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator { return }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - Coordinator
    
    func start() {
       
    }
    
}

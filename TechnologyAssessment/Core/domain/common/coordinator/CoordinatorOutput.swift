//
//  CoordinatorOutput.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
protocol CoordinatorFinishOutput {
    var finishFlow: (() -> Void)? { get set }
}

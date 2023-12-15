//
//  UIStoryboard+Extension.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import Foundation
import UIKit

extension UIStoryboard {
  enum Name: String {
    case article = "Article"
  }
  
  convenience init(name: Name, bundle: Bundle? = nil) {
    self.init(name: name.rawValue, bundle: bundle)
  }
}

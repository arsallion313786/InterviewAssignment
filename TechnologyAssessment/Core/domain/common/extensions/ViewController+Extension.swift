//
//  ViewController+Extension.swift
//  TechnologyAssessment
//
//  Created by Muhammad Arslan Khalid on 15/12/2023.
//

import UIKit

extension UIViewController {
  func showAlertWithTitle(_ title: String, message: String) {
    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    alert.addAction(
      UIAlertAction(
        title: "OK",
        style: .default
      )
    )
    present(alert, animated: true)
  }
}

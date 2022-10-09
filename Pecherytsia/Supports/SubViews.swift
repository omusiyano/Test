//
//  SubViews.swift
//  Pecherytsia
//
//  Created by Dmitry Serebro on 08.10.2022.
//

import Foundation
import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    for view in views {
      addSubview(view)
    }
  }
}

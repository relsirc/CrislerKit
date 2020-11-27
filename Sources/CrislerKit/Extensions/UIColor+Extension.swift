//
//  File.swift
//  
//
//  Created by Crisler on 2020/11/27.
//

import UIKit

// Make a default 1 by 1 uiimage image from a color (for filling or something)
extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

}


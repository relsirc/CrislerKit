//
//  File.swift
//  
//
//  Created by Crisler Chee on 2019/10/09.
//

import Foundation
import SafariServices

extension UIViewController {
    
    func openWebsite(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.delegate = self
        self.navigationController?.present(safariViewController, animated: true)
    }
}

extension UIViewController: SFSafariViewControllerDelegate {
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true)
    }
}

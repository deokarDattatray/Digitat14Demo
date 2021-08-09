//
//  ViewController+Helper.swift
//  Digitat14DemoTests
//
//  Created by Dattatray Deokar on 09/08/21.
//

import UIKit

extension UIViewController {
    var presenterVC: UIViewController {
        parent?.presenterVC ?? parent ?? self
    }
}

extension UIViewController {
    func triggerLifecycleIfNeeded() {
        guard !isViewLoaded else { return }
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
}

//  Copyright © 2018 SkeletonView. All rights reserved.

import UIKit

protocol SkeletonFlowDelegate {
    func willBeginShowingSkeletons(withRootView rootView: UIView)
    func didShowSkeletons(withRootView rootView: UIView)
    func willBeginHidingSkeletons(withRootView rootView: UIView)
    func didHideSkeletons(withRootView rootView: UIView)
}

@objc open class SkeletonFlowHandler: SkeletonFlowDelegate {

    open func willBeginShowingSkeletons(withRootView rootView: UIView) {
        rootView.addAppNotificationsObservers()
    }

    open func didShowSkeletons(withRootView rootView: UIView) {
        printSkeletonHierarchy(in: rootView)
    }
    
    open func willBeginHidingSkeletons(withRootView rootView: UIView) {
        rootView.removeAppNoticationsObserver()
    }

    open func didHideSkeletons(withRootView rootView: UIView) {
        rootView.flowDelegate = nil
    }
}

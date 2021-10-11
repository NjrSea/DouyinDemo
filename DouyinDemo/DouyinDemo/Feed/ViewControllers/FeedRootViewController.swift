//
//  FeedRootViewController.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/9/1.
//

import UIKit

class FeedRootViewController: UIViewController, FeedContainerViewControllerDelegate  {

    private var containerVC: FeedContainerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // container VC
        containerVC = FeedContainerViewController()
        containerVC.delegate = self

        addChild(childViewController: containerVC) { subview in
            subview.snp.makeConstraints { make in
                make.leading.trailing.top.equalTo(self.view)
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottomMargin)
            }
        }

    }

    // MARK: FeedContainerViewControllerDelegate

    func feedContainerViewController(controller: FeedContainerViewController, viewControllerAt indexPath: IndexPath) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.randomColor
        return vc
    }

    func numberOfViewControllers(in containerViewController: FeedContainerViewController) -> Int {
        return 2
    }

}

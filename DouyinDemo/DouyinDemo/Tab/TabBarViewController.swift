//
//  TabBarViewController.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/9/1.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        // 首页
        let feedRootVC = FeedRootViewController()
        addChildViewController(childViewController: feedRootVC, title: "首页")

        // 朋友
        let friendRootVC = FriendViewController()
        addChildViewController(childViewController: friendRootVC, title: "朋友")

        // 相机
        let cameraRootVC = CameraRootViewController()
        let addImage = UIImage(named: "icon_home_add")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        addChildViewController(childViewController: cameraRootVC, title: nil, image: addImage, selectedImage: addImage)

        // 消息
        let messageRootVC = MessageRootViewController()
        addChildViewController(childViewController: messageRootVC, title: "消息")

        // 我
        let profileRootVC = ProfileRootViewController()
        addChildViewController(childViewController: profileRootVC, title: "我")
    }

    // MARK: Private

    func addChildViewController(childViewController: UIViewController, title: String?, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        let navigationController = UINavigationController(rootViewController: childViewController)
        navigationController.setNavigationBarHidden(true, animated: false)

        let tabBarItem = navigationController.tabBarItem

        tabBarItem?.title = title
        tabBarItem?.image = image
        tabBarItem?.selectedImage = selectedImage

        if let _ = title {
            tabBarItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.red,
                                                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)],
                                               for: UIControl.State.normal)
            tabBarItem?.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.blue,
                                                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)],
                                               for: UIControl.State.selected)

            tabBarItem?.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        } else {
            tabBarItem?.imageInsets = UIEdgeInsets(top: 5.5, left: 0, bottom: -5.5, right: 0)
        }
        addChild(navigationController)
    }

}

//
//  FeedContainerCollectionViewCell.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/9/8.
//

import UIKit

class FeedContainerCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifierString = "FeedContainerCollectionViewCell"

    private var viewController: UIViewController?

    public func config(with viewController: UIViewController) {
        self.viewController?.view.removeFromSuperview()
        self.viewController = viewController

        if let view = self.viewController?.view {
            self.contentView.addSubview(view)
            view.snp.makeConstraints { make in
                make.edges.equalTo(0)
            }
        }
    }
    
}

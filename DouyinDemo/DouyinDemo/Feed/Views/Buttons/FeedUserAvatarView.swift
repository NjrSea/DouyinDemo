//
//  FeedUserAvatarView.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/12/21.
//

import Foundation
import UIKit
import Kingfisher

class FeedUserAvatarView: UIView {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    private lazy var followButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor.red
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        return button
    }()

    private lazy var tapGesture: UITapGestureRecognizer = {
        UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
    }()

    init(user: FeedModel.Author) {
        super.init(frame: .zero)

        addSubview(imageView)
        addSubview(followButton)

        let followButtonHeight: CGFloat = 20

        imageView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(self)
            make.centerX.equalTo(self)
            make.width.height.equalTo(40)
            make.bottom.equalTo(self).offset(-followButtonHeight / 2)
        }
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true

        followButton.snp.makeConstraints { make in
            make.width.height.equalTo(followButtonHeight)
            make.centerX.equalTo(self.imageView)
            make.bottom.equalTo(self)
        }

        imageView.addGestureRecognizer(tapGesture)

        if let url = user.avatarURL {
            imageView.kf.setImage(with: .network(url))
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 50, height: 50)
        }
    }

    // MARK: Action

    @objc func didClickButton() {

    }

    @objc func didTap(_ gesture: UITapGestureRecognizer) {

    }

}

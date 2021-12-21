//
//  FeedLikeButton.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/12/21.
//

import Foundation
import UIKit
import Lottie

class FeedLikeButton: UIView {

    private let likeAnimationView: AnimationView = AnimationView(name: "icon_home_like_new")

    private let dislikeAnimationView: AnimationView = AnimationView(name: "icon_home_dislike_new")

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "123w"
        label.font = UIFont.systemFont(ofSize: 12)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 5
        label.layer.shadowOffset = CGSize(width: 1, height: 1)
        label.layer.shadowOpacity = 1
        return label
    }()

    private var isLike = false

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(likeAnimationView)
        addSubview(dislikeAnimationView)
        addSubview(label)
        setAnimationViewsHiddenState(isLike: true)

        likeAnimationView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.greaterThanOrEqualTo(self.snp.top)
            make.bottom.equalTo(label.snp.top).offset(5)
            make.centerX.equalTo(self)
        }

        dislikeAnimationView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.top.greaterThanOrEqualTo(self.snp.top)
            make.bottom.equalTo(self.label.snp.top).offset(5)
            make.centerX.equalTo(self)
        }

        label.snp.makeConstraints { make in
            make.leading.trailing.equalTo(0)
            make.height.equalTo(20)
            make.bottom.equalTo(self.snp.bottom)
        }

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap(gesture:)))
        addGestureRecognizer(tapGesture)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setAnimationViewsHiddenState(isLike: Bool) {
        likeAnimationView.isHidden = !isLike
        dislikeAnimationView.isHidden = isLike
    }

    @objc func didTap(gesture: UITapGestureRecognizer) {
        isLike = !isLike

        setAnimationViewsHiddenState(isLike: isLike)

        if isLike {
            likeAnimationView.play(completion: nil)
        } else {
            dislikeAnimationView.play(completion: nil)
        }
    }

    override var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 50, height: 70)
        }
    }

}

//
//  FeedViewController.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/11/10.
//

import Foundation
import UIKit
import AVFoundation


class PlayerView: UIView {

    private var playerLayer: AVPlayerLayer

    init(player: AVPlayer?) {
        playerLayer = AVPlayerLayer(player: player)
        super.init(frame: .zero)
        layer.addSublayer(playerLayer)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }

}

class FeedViewController: UIViewController {

    private var feed: FeedModel

    private var player: AVPlayer?

    private lazy var playerView: PlayerView = {
        PlayerView(player: self.player)
    }()

    private lazy var avatarButton: FeedUserAvatarView = {
        return FeedUserAvatarView(user: self.feed.author ?? FeedModel.Author(id: "0", name: "未知"))
    }()

    private lazy var likeButton: FeedLikeButton =  {
        let button = FeedLikeButton(frame: .zero)
        return button
    }()

    private lazy var commentButton: UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_home_comment40x40"), for: .normal)
        return button
    }()

    private lazy var shareButton: UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(named: "iconHomeShareRight40x40"), for: .normal)
        return button
    }()

    private lazy var rightButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    init(with feed: FeedModel) {
        self.feed = feed
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // player
        player = AVPlayer(url: feed.videoURL!)
        view.addSubview(playerView)

        playerView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }

        view.addSubview(rightButtonsStackView)

        rightButtonsStackView.addArrangedSubview(avatarButton)
        rightButtonsStackView.addArrangedSubview(likeButton)
        rightButtonsStackView.addArrangedSubview(commentButton)
        rightButtonsStackView.addArrangedSubview(shareButton)

        rightButtonsStackView.snp.makeConstraints { make in
            make.width.equalTo(80)
            make.bottom.equalTo(self.view.snp.bottom).offset(-200)
            make.trailing.equalTo(self.view.snp.trailing).offset(-10)
        }


        // 1 点击屏幕 暂停播放、继续播放
        // 2 player loop
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pause()
    }

    func play() {
        player?.play()
    }

    func pause() {
        player?.pause()
    }


}

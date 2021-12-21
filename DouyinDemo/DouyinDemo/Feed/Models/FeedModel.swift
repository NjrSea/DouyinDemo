//
//  FeedModel.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/11/10.
//

import Foundation

struct FeedModel {

    struct Author {
        var id: String?
        var name: String?
        var avatarURL: URL? = URL(string: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201904%2F28%2F20190428224745_yqovs.thumb.700_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612314529&t=851290fc7708cfe9683a47fa5bb33a92")
    }

    var id: String?

    var videoURL: URL? = URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")

    var coverURL: URL?

    var author: Author?

    var likeCount: String?

}

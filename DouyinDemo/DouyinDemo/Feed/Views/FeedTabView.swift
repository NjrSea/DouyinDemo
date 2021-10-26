//
//  FeedTabView.swift
//  DouyinDemo
//
//  Created by wang ya on 2021/10/11.
//

import Foundation
import UIKit

protocol FeedTabViewDelegate: NSObjectProtocol {

    func didSelect(item: FeedTabView.Item, in tabView: FeedTabView)

}

class FeedTabView: UIView {

    struct Item {
        var index: Int
        var title: String
    }

    private var items: [Item] = []

    private var buttons: [UIButton] = [UIButton]()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return line
    }()

    private var selectedIndex: Int = 0

    public weak var delegate: FeedTabViewDelegate?

    init(items: [Item], delegate: FeedTabViewDelegate) {
        // items
        self.items = items

        // delegate
        self.delegate = delegate

        super.init(frame: CGRect.zero)

        // buttons
        self.buttons = self.items.map({ item in
            return self.createButton(item: item)
        })

        self.buttons.forEach { button in
            self.stackView.addArrangedSubview(button)
        }

        addSubview(stackView)
        addSubview(bottomLine)
        backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

        updateSelectedIndex(with: 0)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        stackView.frame = bounds

        updateSelectedIndex(with: CGFloat(selectedIndex))
    }

    public func updateSelectedIndex(with progress: CGFloat) {
        let buttonWidth = bounds.width / CGFloat(items.count)

        // bottom line
        var frame: CGRect = CGRect.zero
        frame.size = CGSize(width: 20, height: 4)
        frame.origin.y = bounds.height - frame.size.height
        frame.origin.x = (buttonWidth - frame.width) / 2 + buttonWidth * progress
        bottomLine.frame = frame

        selectedIndex = Int(round(progress))

        for i in 0..<buttons.count {
            let button = buttons[i]
            button.isSelected = (i == selectedIndex)
        }
    }

    private func createButton(item: Item) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(item.title, for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .selected)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .highlighted)
        button.addTarget(self, action: #selector(didTap(button:)), for: .touchUpInside)
        return button
    }

    @objc private func didTap(button: UIButton) {
        guard let index = buttons.firstIndex(of: button), index < items.count else {
            return
        }

        delegate?.didSelect(item: items[index], in: self)
    }

}

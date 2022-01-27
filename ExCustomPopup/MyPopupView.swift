//
//  MyPopupView.swift
//  ExCustomPopup
//
//  Created by Jake.K on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class MyPopupView: UIView {
  private let popupView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 12
    $0.clipsToBounds = true
  }
  private let bodyStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 8
  }
  private let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.font = .systemFont(ofSize: 30)
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  private let descLabel = UILabel().then {
    $0.textColor = .gray
    $0.font = .systemFont(ofSize: 24)
    $0.numberOfLines = 0
    $0.textAlignment = .center
  }
  private let separatorLineView = UIView().then {
    $0.backgroundColor = .gray
  }
  private let leftButton = UIButton().then {
    $0.setTitleColor(.white, for: .normal)
    $0.setBackgroundImage(UIColor.systemBlue.withAlphaComponent(0.5).asImage(), for: .normal)
    $0.setBackgroundImage(UIColor.systemBlue.asImage(), for: .highlighted)
  }
  private let rightButton = UIButton().then {
    $0.setTitleColor(.white, for: .normal)
    $0.setBackgroundImage(UIColor.systemBlue.asImage(), for: .normal)
    $0.setBackgroundImage(UIColor.blue.asImage(), for: .highlighted)
  }
  
  init(title: String, desc: String, leftButtonTitle: String = "Cancel", rightButtonTitle: String = "Submit") {
    self.titleLabel.text = title
    self.descLabel.text = desc
    self.leftButton.setTitle(leftButtonTitle, for: .normal)
    self.rightButton.setTitle(rightButtonTitle, for: .normal)
    super.init(frame: .zero)
    
    self.backgroundColor = .black.withAlphaComponent(0.3)
    self.addSubview(self.popupView)
    [self.bodyStackView, self.separatorLineView, self.leftButton, self.rightButton]
      .forEach(self.popupView.addSubview(_:))
    [self.titleLabel, self.descLabel]
      .forEach(self.bodyStackView.addArrangedSubview(_:))
    
    self.popupView.snp.makeConstraints {
      $0.left.right.equalToSuperview().inset(32)
      $0.centerY.equalToSuperview()
    }
    self.bodyStackView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(32)
      $0.left.right.equalToSuperview().inset(24)
    }
    self.separatorLineView.snp.makeConstraints {
      $0.top.equalTo(self.bodyStackView.snp.bottom).offset(24)
      $0.left.right.equalToSuperview()
      $0.height.equalTo(1)
    }
    self.leftButton.snp.makeConstraints {
      $0.top.equalTo(self.separatorLineView.snp.bottom)
      $0.bottom.left.equalToSuperview()
      $0.width.equalToSuperview().dividedBy(2)
      $0.height.equalTo(56)
    }
    self.rightButton.snp.makeConstraints {
      $0.top.equalTo(self.separatorLineView.snp.bottom)
      $0.bottom.right.equalToSuperview()
      $0.width.equalToSuperview().dividedBy(2)
      $0.height.equalTo(56)
    }
  }
  
  required init?(coder: NSCoder) { fatalError() }
}

extension UIColor {
  func asImage(_ width: CGFloat = UIScreen.main.bounds.width, _ height: CGFloat = 1.0) -> UIImage {
    let size: CGSize = CGSize(width: width, height: height)
    let image: UIImage = UIGraphicsImageRenderer(size: size).image { context in
      setFill()
      context.fill(CGRect(origin: .zero, size: size))
    }
    return image
  }
}

//
//  ViewController.swift
//  ExCustomPopup
//
//  Created by Jake.K on 2022/01/27.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
  
  private let button = UIButton().then {
    $0.setTitleColor(.systemBlue, for: .normal)
    $0.setTitleColor(.blue, for: .normal)
    $0.setTitle("팝업 띄우기", for: .normal)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.button)
    self.button.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.centerX.equalToSuperview()
    }
    self.button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
  }
  @objc private func didTapButton() {
    let popupViewController = MyPopupViewController(title: "타이틀", desc: "디스크립션")
    popupViewController.modalPresentationStyle = .overFullScreen
    self.present(popupViewController, animated: false)
  }
}


//
//  WebViewerController.swift
//  read_online
//
//  Created by marwa awwad mohamed awwad on 29/04/2024.
//

import UIKit
import WebKit

class WebViewerController: UIViewController {
    private let urlString: String
    private let webKit = WKWebView()
    init(with urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        self.webKit.load(URLRequest(url: url))
    }
    //MARK: - UI Setup
    private func setUpUI() {
        self.view.addSubview(webKit)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        webKit.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.webKit.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.webKit.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webKit.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.webKit.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
  
            
        ])
    }
    @objc private func didTapDone() {
        self.dismiss(animated: true , completion: nil)
    }
}

//
//  AuthLegacy.swift
//  Konieg
//
//  Created by David I on 12.12.2024.
//
import Foundation
import WebKit
import Combine

class WebViewModel: NSObject, ObservableObject, WKScriptMessageHandler {
    @Published var webView = WKWebView()
    @Published var basicInfo: BasicInfo

    @Published var token: String?
    @Published var studentId: Int?
    private var state: Int = 0
    private var timer: Timer?

    init(basicInfo: BasicInfo) {
        self.basicInfo = basicInfo
        super.init()

        self.webView = WKWebView()
        configureWebView()
    }
    func clearCache() {
        let websiteDataTypes = WKWebsiteDataStore.allWebsiteDataTypes()
        let date = Date(timeIntervalSince1970: 0)
        WKWebsiteDataStore.default().removeData(ofTypes: websiteDataTypes, modifiedSince: date) {
            print("cache clear")
            self.loadInitialPage()
        }
    }

    private func configureWebView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "tokenHandler")

        let config = WKWebViewConfiguration()
        config.userContentController = contentController

        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
    }

    func loadInitialPage() {
        if let url = URL(string: "https://school.mos.ru") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }

    func startCheckingForToken() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.checkForToken()
        }
    }

    private func checkForToken() {
        WKWebsiteDataStore.default().httpCookieStore.getAllCookies { [weak self] cookies in
            guard let self = self else { return }
            for cookie in cookies {
                if cookie.name == "aupd_token" {
                    self.basicInfo.TOKEN = cookie.value
                    self.state = 1
                    print("Authenticated successfully with token: \(self.token ?? "")")
                    self.timer?.invalidate()
                    self.timer = nil
                    self.webView.removeFromSuperview()
                    break
                }
            }
        }
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "tokenHandler", let token = message.body as? String {
            DispatchQueue.main.async {
                self.basicInfo.TOKEN = token
                self.basicInfo.succesAuth = true
            }
        }
    }
}

extension WebViewModel: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        startCheckingForToken()
    }
}


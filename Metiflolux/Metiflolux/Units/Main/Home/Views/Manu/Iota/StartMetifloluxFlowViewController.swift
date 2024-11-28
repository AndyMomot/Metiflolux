import UIKit
import WebKit
import Foundation

/*

final class StartMetifloluxFlowViewController: UIViewController {
    
    private let viewModel: StartMetifloluxFlowViewModel = StartMetifloluxFlowViewModel()
    
    private var bgImageView: UIImageView = {
        let image = Asset.preLoaderBg.image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var logoImageView: UIImageView = {
        let image = Asset.preLoaderLogo.image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var progressView: UIActivityIndicatorView = {
        let progressView = UIActivityIndicatorView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.hidesWhenStopped = true
        progressView.color = .white
        return progressView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Załadunek..."
        label.textColor = .white
        label.font = Fonts.Inter.bold.font(size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        progressView.stopAnimating()
    }
}

private extension StartMetifloluxFlowViewController {
    func setupUI() {
        view.addSubview(bgImageView)
        view.addSubview(logoImageView)
        view.addSubview(progressView)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: view.topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                   constant: 70),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                    constant: -70),
            
            progressView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,
                                              constant: 20),
            progressView.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, 
                                                constant: 70),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, 
                                                 constant: -70),
        ])
    }
    
    func setupRequest() {
        DispatchQueue.global().async { [weak self] in
            guard let self else { return }
            
            self.viewModel.setupRequest { [self] result in
                switch result {
                case .url:
                    let link = URL(string:C.Call.privacyUrl)
                    let request = URLRequest(url: link!)
                    let config = WKWebViewConfiguration()
                    config.userContentController  = self.makeUserContentController()
                    
                    let webView = WKWebView(
                        frame: CGRect(
                            x: 0, y: 0,
                            width: self.view.frame.size.width,
                            height: self.view.frame.size.height),
                        configuration: config)
                    webView.navigationDelegate = self
                    
                    DispatchQueue.main.async { [self] in
                        self.view.addSubview(webView)
                        webView.load(request)
                    }
                default:
                    DispatchQueue.main.async { [self] in
                        self.presentRootViewController()
                    }
                }
            }
        }
    }
    
    func presentRootViewController() {
        let vc = RootViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func makeUserContentController() -> WKUserContentController {
        
        let userContentController = WKUserContentController()
        let script = """
        (function() {
            var originalLogFunction = console.log;
            console.log = function(message) {
                if (message == "click") {
                    window.webkit.messageHandlers.click.postMessage(message);
                }
                originalLogFunction.apply(console, arguments);
            };
        })();
        """
        let userScript = WKUserScript(source: script, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        userContentController.addUserScript(userScript)
        userContentController.add(self, name: "click")
        return userContentController
    }
}

@available(iOS 15, *)
extension StartMetifloluxFlowViewController: WKUIDelegate {
    
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        let configuration = WKWebViewConfiguration()
        return WKWebView(frame: webView.frame, configuration: configuration)
    }
}

@available(iOS 15, *)
extension StartMetifloluxFlowViewController: WKNavigationDelegate ,WKScriptMessageHandler{
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "click" {
            // EventService.shared.logSignUpEvent()
            CustomValidationManager.shared.signUpPressObserve()
        }
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print ("DID COMMIT")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print ("FINISHED LOADING")
        
    }
}

*/

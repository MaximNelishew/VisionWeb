import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    var viewRect: HandleDetectedRectangles!
    
    override func loadView() {
        super.loadView()
        webView.uiDelegate = self
        webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewRect = HandleDetectedRectangles(frame: webView.bounds)
        self.webView.addSubview(viewRect)
    }
    
    // Did End On Exit
    @IBAction func changeURL(_ sender: UITextField) {
        guard let text = sender.text else { return }
        webView.loader(text)
    }
    
    @IBAction func backButtonPress(_ sender: UIBarButtonItem) {
        webView.stopLoading(); webView.goBack()
    }
    
    @IBAction func forwardButtonPress(_ sender: UIBarButtonItem) {
        webView.stopLoading(); webView.goForward()
    }
    
    @IBAction func refreshButtonPress(_ sender: UIBarButtonItem) {
        webView.reload()
    }
}

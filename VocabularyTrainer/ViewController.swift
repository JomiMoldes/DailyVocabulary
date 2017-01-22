import UIKit

class ViewController: UIViewController {

    var operations : [REDFetchTranslationOperation]?
    var operationsQueue : MMOperationsQueue?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let vc = REDInputWordViewController(nibName: "REDInputWordView", bundle: nil)
        vc.inputWordViewModel = REDInputWordViewModel(userSession: REDGlobalModels.sharedInstance.userSession)
        self.navigationController?.pushViewController(vc, animated: true)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


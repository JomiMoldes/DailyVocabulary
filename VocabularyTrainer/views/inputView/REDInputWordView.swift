import Foundation
import UIKit

class REDInputWordView : UIView {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var insertLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var conjugationLabel: UILabel!

    var model : REDInputWordViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        resultLabel.text = ""
        conjugationLabel.text = ""
    }




}

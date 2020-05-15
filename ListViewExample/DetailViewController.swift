import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textLabel:UILabel?
    
    var text:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel?.text = text
    }
}

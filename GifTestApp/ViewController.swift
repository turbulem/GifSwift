
import UIKit
import GifSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let file = GifFile(path: Bundle.main.url(forResource: "cat", withExtension: "gif")!)
        debugPrint(file.dimensionsInfo)
    }


}


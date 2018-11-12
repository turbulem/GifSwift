
import UIKit
import GifSwift

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        if let file = GifFile(path: Bundle.main.url(forResource: "cat", withExtension: "gif")!) {
            debugPrint("Image has size: \(file.size) and contains \(file.imagesCount) images")
        }
    }
}


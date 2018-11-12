
import Foundation
import CLibgif

public class GifFile {

    private let path: URL

    public init(path: URL) {
        self.path = path
    }

    public var dimensionsInfo: String? {
        let errorCode: UnsafeMutablePointer<Int32> = UnsafeMutablePointer.allocate(capacity: 1)
        let handlePtr = path.path.withCString { (ptr) in
            return DGifOpenFileName(ptr, errorCode)
        }

        if let handle = handlePtr?.pointee {
            return "Width: \(handle.SWidth) Height: \(handle.SHeight)"
        }

        return nil
    }

}



import Foundation
import GifSwift.CLibgif

public class GifFile {

    private let path: String
    private let fileHandlePtr: UnsafeMutablePointer<GifFileType>
    private var fileHandle: GifFileType {
        return self.fileHandlePtr.pointee
    }

    deinit {
        DGifCloseFile(self.fileHandlePtr, nil)
    }

    // MARK: - API

    public init?(path: String) {
        self.path = path

        let errorCode = UnsafeMutablePointer<Int32>.allocate(capacity: 1)
        if let handle = path.withCString({ DGifOpenFileName($0, errorCode) }) {
            self.fileHandlePtr = handle
            DGifSlurp(handle)
        } else {
            debugPrint("Error opening file \(errorCode.pointee)")
            return nil
        }
    }

    public var size: CGSize {
        return CGSize(width: Double(fileHandle.SWidth), height: Double(fileHandle.SHeight))
    }

    public var imagesCount: Int {
        return Int(fileHandle.ImageCount)
    }
}


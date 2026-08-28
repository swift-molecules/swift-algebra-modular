public import Algebra
public import struct Cardinal.Cardinal

extension Algebra {

    public protocol Residual {

        static var capacity: Cardinal { get }
    }
}

public import Algebra
public import struct Cardinal.Cardinal

extension Algebra {

    public enum Residue<let n: Int>: Residual, Hashable, Sendable {
    }
}

extension Algebra.Residue {

    @inlinable
    public static var capacity: Cardinal { Cardinal(UInt(n)) }
}

public import Algebra
public import struct Ordinal.Ordinal
public import struct Tagged.Tagged

extension Tagged where Tag: Algebra.Residual, Underlying == Ordinal {

    @inlinable
    public static var semiring: Algebra.Semiring<Self>.Commutative? {
        ring?.semiring
    }
}

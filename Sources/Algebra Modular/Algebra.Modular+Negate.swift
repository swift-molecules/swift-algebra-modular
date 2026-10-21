internal import Addition
public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Property
internal import Subtraction
internal import Tagged

public import struct Cardinal.Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func negate(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        guard a.rawValue != UInt.zero else { return a }
        let result = modulus.cardinal.subtract.saturating(Cardinal(a))
        return Ordinal(result)
    }
}

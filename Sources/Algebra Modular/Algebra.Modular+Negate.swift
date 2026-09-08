public import Algebra
public import struct Cardinal.Cardinal
public import Addition
public import Cardinal
public import Property
public import Subtraction
public import Ordinal_Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func negate(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        guard a.rawValue != UInt.zero else { return a }
        let result = modulus.cardinal.subtract.saturating(Cardinal(a))
        return Ordinal(result)
    }
}

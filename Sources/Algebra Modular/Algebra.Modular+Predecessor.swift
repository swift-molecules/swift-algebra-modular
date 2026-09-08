public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal
public import Addition
public import Property
public import Subtraction
public import Ordinal_Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func predecessor(_ a: Ordinal, modulus: Modulus) -> Ordinal {

        let nMinusOne = modulus.cardinal.subtract.saturating(Cardinal(1))
        return (a + nMinusOne) % modulus.cardinal
    }
}

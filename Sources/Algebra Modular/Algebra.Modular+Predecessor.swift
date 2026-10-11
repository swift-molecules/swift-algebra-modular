public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal
internal import Addition
internal import Property
internal import Subtraction
internal import Carrier
public import Ordinal
internal import Tagged
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func predecessor(_ a: Ordinal, modulus: Modulus) -> Ordinal {

        let nMinusOne = modulus.cardinal.subtract.saturating(Cardinal(1))
        return (a + nMinusOne) % modulus.cardinal
    }
}

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
    public static func subtract(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {

        let negB = modulus.cardinal.subtract.saturating(Cardinal(b))
        return (a + negB) % modulus.cardinal
    }
}

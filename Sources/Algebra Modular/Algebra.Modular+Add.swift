public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal
public import Carrier
public import Ordinal
public import Tagged
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func add(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {
        (a + Cardinal(b)) % modulus.cardinal
    }
}

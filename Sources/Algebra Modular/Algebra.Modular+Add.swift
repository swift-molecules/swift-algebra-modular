public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal_Carrier
public import Ordinal_Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func add(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {
        (a + Cardinal(b)) % modulus.cardinal
    }
}

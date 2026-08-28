public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal_Carrier
public import Ordinal_Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func successor(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        (a + Cardinal(1)) % modulus.cardinal
    }
}

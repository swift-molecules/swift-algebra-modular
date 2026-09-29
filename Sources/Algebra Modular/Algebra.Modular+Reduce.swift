public import Algebra
public import Cardinal
public import Carrier
public import Ordinal
public import Tagged
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func reduce(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        a % modulus.cardinal
    }
}

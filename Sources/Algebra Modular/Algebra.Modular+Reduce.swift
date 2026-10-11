public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Tagged
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func reduce(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        a % modulus.cardinal
    }
}

public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Tagged

public import struct Cardinal.Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func successor(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        (a + Cardinal(1)) % modulus.cardinal
    }
}

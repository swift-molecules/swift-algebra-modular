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
    public static func subtract(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {

        let m = modulus.cardinal.rawValue
        let lhs = a.rawValue % m
        let rhs = b.rawValue % m
        return Ordinal(lhs >= rhs ? lhs - rhs : lhs &- rhs &+ m)
    }
}

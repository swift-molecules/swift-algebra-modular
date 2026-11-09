public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Tagged

public import struct Cardinal.Cardinal
public import struct Ordinal.Ordinal

extension Algebra {

    public enum Modular {}
}

extension Algebra.Modular {

    @inlinable
    public static func add(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {
        let m = modulus.cardinal.rawValue
        let sum = (a.rawValue % m).addingReportingOverflow(b.rawValue % m)
        return Ordinal(sum.overflow || sum.partialValue >= m ? sum.partialValue &- m : sum.partialValue)
    }
}

extension Algebra.Modular {

    @inlinable
    public static func negate(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        let m = modulus.cardinal.rawValue
        let r = a.rawValue % m
        return Ordinal(r == UInt.zero ? r : m - r)
    }
}

extension Algebra.Modular {

    @inlinable
    public static func predecessor(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        subtract(a, Ordinal(UInt(1)), modulus: modulus)
    }
}

extension Algebra.Modular {

    @inlinable
    public static func reduce(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        a % modulus.cardinal
    }
}

extension Algebra.Modular {

    @inlinable
    public static func subtract(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {

        let m = modulus.cardinal.rawValue
        let lhs = a.rawValue % m
        let rhs = b.rawValue % m
        return Ordinal(lhs >= rhs ? lhs - rhs : lhs &- rhs &+ m)
    }
}

extension Algebra.Modular {

    @inlinable
    public static func successor(_ a: Ordinal, modulus: Modulus) -> Ordinal {
        add(a, Ordinal(UInt(1)), modulus: modulus)
    }
}

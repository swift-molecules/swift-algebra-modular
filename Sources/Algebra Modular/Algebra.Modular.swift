internal import Addition
public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Property
internal import Subtraction
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
        guard a.rawValue != UInt.zero else { return a }
        let result = modulus.cardinal.subtract.saturating(Cardinal(a))
        return Ordinal(result)
    }
}

extension Algebra.Modular {

    @inlinable
    public static func predecessor(_ a: Ordinal, modulus: Modulus) -> Ordinal {

        let nMinusOne = modulus.cardinal.subtract.saturating(Cardinal(1))
        return (a + nMinusOne) % modulus.cardinal
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
        (a + Cardinal(1)) % modulus.cardinal
    }
}

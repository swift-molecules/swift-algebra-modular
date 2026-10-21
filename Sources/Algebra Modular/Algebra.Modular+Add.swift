public import Algebra
public import Cardinal
internal import Carrier
public import Ordinal
internal import Tagged

public import struct Cardinal.Cardinal
public import struct Ordinal.Ordinal

extension Algebra.Modular {

    @inlinable
    public static func add(_ a: Ordinal, _ b: Ordinal, modulus: Modulus) -> Ordinal {
        let m = modulus.cardinal.rawValue
        let sum = (a.rawValue % m).addingReportingOverflow(b.rawValue % m)
        return Ordinal(sum.overflow || sum.partialValue >= m ? sum.partialValue &- m : sum.partialValue)
    }
}

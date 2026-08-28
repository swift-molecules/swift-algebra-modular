public import Algebra
public import struct Cardinal.Cardinal
public import Cardinal_Property
public import struct Ordinal.Ordinal
public import struct Tagged.Tagged

extension Tagged where Tag: Algebra.Residual, Underlying == Ordinal {

    @inlinable
    public static var ring: Algebra.Ring<Self>.Commutative? {
        let capacity = Tag.capacity
        guard capacity > Cardinal(0) else { return nil }
        let bound = capacity.subtract.saturating(Cardinal(1))
        let raw = bound.rawValue
        let (_, overflow) = raw.multipliedReportingOverflow(by: raw)
        guard !overflow else { return nil }
        return .init(
            ring: .init(
                additive: .init(
                    group: .init(
                        identity: Self.zero,
                        combining: { $0 + $1 },
                        inverting: { $0.negated }
                    )
                ),
                multiplicative: .init(
                    identity: Self.one,
                    combining: { lhs, rhs in

                        do throws(Self.Error) {
                            return try lhs * rhs
                        } catch {
                            fatalError("unreachable: modular product overflow in a validated ring")
                        }
                    }
                )
            )
        )
    }
}

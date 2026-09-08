public import Algebra
public import struct Ordinal.Ordinal
import Hash
import Ordinal
public import struct Tagged.Tagged

extension Tagged where Tag: Algebra.Residual, Underlying == Ordinal {

    public enum Error: Swift.Error, Hashable, Sendable {

        case bounds(Ordinal)

        case arithmetic
    }
}

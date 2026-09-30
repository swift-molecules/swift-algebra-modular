import Algebra_Modular
import Testing

@Suite
struct `Modular arithmetic boundaries` {
    @Test
    func `modulus one maps everything to zero`() throws {
        let one = try Algebra.Modular.Modulus(Cardinal(1))
        #expect(Algebra.Modular.add(Ordinal(UInt(0)), Ordinal(UInt(0)), modulus: one).rawValue == 0)
        #expect(Algebra.Modular.reduce(Ordinal(UInt(41)), modulus: one).rawValue == 0)
        #expect(Algebra.Modular.negate(Ordinal(UInt(0)), modulus: one).rawValue == 0)
    }

    @Test
    func `successor of the last residue wraps to zero and predecessor of zero wraps to the last`() throws {
        let seven = try Algebra.Modular.Modulus(Cardinal(7))
        #expect(Algebra.Modular.successor(Ordinal(UInt(6)), modulus: seven).rawValue == 0)
        #expect(Algebra.Modular.predecessor(Ordinal(UInt(0)), modulus: seven).rawValue == 6)
    }

    @Test
    func `addition near the top of UInt reduces instead of overflowing`() throws {
        let largest = try Algebra.Modular.Modulus(Cardinal(UInt.max))
        let a = Ordinal(UInt.max - 1)
        #expect(Algebra.Modular.add(a, a, modulus: largest).rawValue == UInt.max - 2)
    }

    @Test
    func `subtraction near the top of UInt reduces instead of overflowing`() throws {
        let largest = try Algebra.Modular.Modulus(Cardinal(UInt.max))
        #expect(Algebra.Modular.subtract(Ordinal(UInt.max - 1), Ordinal(UInt(1)), modulus: largest).rawValue == UInt.max - 2)
        #expect(Algebra.Modular.subtract(Ordinal(UInt(1)), Ordinal(UInt.max - 1), modulus: largest).rawValue == 2)
    }
}

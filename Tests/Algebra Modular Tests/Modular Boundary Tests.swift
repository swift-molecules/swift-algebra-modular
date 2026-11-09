import Algebra_Modular
import Testing

enum `Modular Boundary Tests` {}

extension `Modular Boundary Tests` {
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

        @Test
        func `negation reduces an unreduced input first`() throws {
            let seven = try Algebra.Modular.Modulus(Cardinal(7))
            #expect(Algebra.Modular.negate(Ordinal(UInt(9)), modulus: seven).rawValue == 5)
            #expect(Algebra.Modular.negate(Ordinal(UInt(14)), modulus: seven).rawValue == 0)
        }

        @Test
        func `successor and predecessor reduce an unreduced input first`() throws {
            let seven = try Algebra.Modular.Modulus(Cardinal(7))
            #expect(Algebra.Modular.successor(Ordinal(UInt(13)), modulus: seven).rawValue == 0)
            #expect(Algebra.Modular.predecessor(Ordinal(UInt(14)), modulus: seven).rawValue == 6)
        }

        @Test
        func `successor near the top of UInt reduces instead of overflowing`() throws {
            let largest = try Algebra.Modular.Modulus(Cardinal(UInt.max))
            #expect(Algebra.Modular.successor(Ordinal(UInt.max), modulus: largest).rawValue == 1)
            #expect(Algebra.Modular.successor(Ordinal(UInt.max - 1), modulus: largest).rawValue == 0)
        }

        @Test
        func `predecessor with a modulus above half of UInt reduces instead of overflowing`() throws {
            let large = try Algebra.Modular.Modulus(Cardinal(UInt.max - 1))
            #expect(Algebra.Modular.predecessor(Ordinal(UInt(5)), modulus: large).rawValue == 4)
            #expect(Algebra.Modular.predecessor(Ordinal.zero, modulus: large).rawValue == UInt.max - 2)
        }
    }
}

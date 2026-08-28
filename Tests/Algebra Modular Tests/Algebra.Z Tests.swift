import Algebra_Modular
import Testing

@Suite struct `Algebra.Z Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Algebra.Z Tests`.Unit {

    @Test
    func `runtime modular arithmetic wraps at the modulus`() throws {
        let modulus = try Algebra.Modular.Modulus(Cardinal(7))

        #expect(
            Algebra.Modular.add(Ordinal(UInt(5)), Ordinal(UInt(4)), modulus: modulus).rawValue
                == 2
        )
        #expect(
            Algebra.Modular.subtract(Ordinal(UInt(1)), Ordinal(UInt(3)), modulus: modulus)
                .rawValue == 5
        )
        #expect(Algebra.Modular.negate(Ordinal(UInt(2)), modulus: modulus).rawValue == 5)
    }

    @Test
    func `runtime successor and predecessor wrap`() throws {
        let modulus = try Algebra.Modular.Modulus(Cardinal(7))

        #expect(Algebra.Modular.successor(Ordinal(UInt(6)), modulus: modulus).rawValue == 0)
        #expect(Algebra.Modular.predecessor(Ordinal.zero, modulus: modulus).rawValue == 6)
    }

    @Test
    func `typed residue arithmetic stays in its class`() throws {
        let a = try Algebra.Z<5>(Ordinal(UInt(3)))
        let b = try Algebra.Z<5>(Ordinal(UInt(4)))

        #expect((a + b).underlying.rawValue == 2)
        #expect((a - b).underlying.rawValue == 4)
        #expect((-a).underlying.rawValue == 2)
        #expect(try (a * b).underlying.rawValue == 2)
    }
}

extension `Algebra.Z Tests`.`Edge Case` {

    @Test
    func `zero modulus is rejected`() {
        #expect(throws: Algebra.Modular.Modulus.Error.zero) {
            try Algebra.Modular.Modulus(Cardinal(0))
        }
    }

    @Test
    func `typed residue rejects its upper bound`() {
        let bound = Ordinal(UInt(5))

        #expect(throws: Algebra.Z<5>.Error.bounds(bound)) {
            try Algebra.Z<5>(bound)
        }
    }
}

extension `Algebra.Z Tests`.Integration {

    @Test
    func `ring witnesses use modular identities`() throws {
        let ring = try #require(Algebra.Z<6>.ring)
        let value = try Algebra.Z<6>(Ordinal(UInt(4)))

        #expect(ring.ring.additive.combining(value, ring.ring.additive.identity).underlying.rawValue == 4)
        #expect(
            ring.ring.multiplicative.combining(value, ring.ring.multiplicative.identity)
                .underlying.rawValue == 4
        )
    }

    @Test
    func `prime modulus exposes reciprocal witness`() throws {
        let field = try #require(Algebra.Z<5>.field())
        let value = try Algebra.Z<5>(Ordinal(UInt(4)))
        let reciprocal = try field.reciprocal(value)

        #expect(reciprocal.underlying.rawValue == 4)
        #expect(
            field.multiplicative.combining(value, reciprocal).underlying.rawValue
                == field.one.underlying.rawValue
        )
    }
}

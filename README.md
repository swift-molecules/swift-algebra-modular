# swift-algebra-modular

Use this package for arithmetic on residues modulo n. When the modulus is only known at run time, start from `Algebra.Modular` with an `Algebra.Modular.Modulus`. Its operations take plain `Ordinal` values and return the reduced residue. When the modulus is fixed at compile time, start from `Algebra.Z<n>` (an alias for `Tagged<Algebra.Residue<n>, Ordinal>`). It gives residue values with operators and algebraic witnesses (`ring`, `semiring`, `field()`). Conform your own tag to `Algebra.Residual` to get the same API for a modulus that is not a generic value.

## Laws

- `Algebra.Modular.add`, `Algebra.Modular.subtract` and `Algebra.Modular.reduce` accept any `Ordinal` and reduce the operands before combining them. The result always lies in `0..<m`, with no intermediate overflow for any modulus up to `UInt.max`.
- `Algebra.Modular.successor` and `Algebra.Modular.predecessor` wrap: the successor of `m − 1` is `0`, and the predecessor of `0` is `m − 1`. Under modulus 1, every result is `0`.
- An `Algebra.Z<n>` value always holds a representative in `0..<n`. Construction rejects any residue `≥ n`, and `+`, `-` and negation stay in that range.
- `Algebra.Z<n>.one` is 1 reduced modulo n, so in `Algebra.Z<1>` it equals `zero`.
- `*` multiplies the two representatives and then reduces. It fails with `arithmetic` when that raw product overflows `UInt`, even though the reduced result would fit.
- `ring` (and `semiring`, which derives from it) exists only when `n ≥ 1` and `(n − 1)²` fits in `UInt`. Inside the ring, multiplication therefore never fails.
- `field()` exists only when `n` is prime and `ring` exists. It tests primality by trial division on every call, and nothing is cached. The field's reciprocal of zero fails with `nonInvertible`. Every other element's reciprocal `r` satisfies `a · r = one`.

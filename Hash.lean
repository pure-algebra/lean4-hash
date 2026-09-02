import Hash.Sha256

/-!
# `Hash` — proved hash functions in Lean 4

The public root of the `Hash` library. A consumer imports this module and
nothing else.

`Hash.Sha256` (S2) carries SHA-256 and SHA-224 from FIPS 180-4, moved from
`lean4-WHATWG-streams` at `a1383bc`. `Hash.Sha3` arrives at S3 from foldlab's
`formal/fips202` at `64be4b2c`, and the algorithm-indexed surface at S4.

The known-answer tests and the per-family axiom audits stay out of this
closure and are reached only through `Hash.Verified`, so a consumer never
elaborates them.
-/

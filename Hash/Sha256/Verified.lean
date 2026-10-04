import Hash.Sha256
import Hash.Sha256.Kats
import Hash.Sha256.Audit

/-!
# `Hash.Sha256.Verified` — the audited root

The SHA-256 family's audited root, reached from `Hash.Verified`, the root of
the `HashVerified` Lake library. It imports the public library and the audit,
and pins the audit's verdict line with `#guard_msgs`, so any drift in the
declaration count, the module count, the ceiling, or the number of
declarations reaching `Classical.choice` is a build error that must be
updated deliberately rather than noticed later.

`docs/SHA256-DAG.md` §5.1 adds `Hash.Sha256.Kats` to this closure. Nothing imported
here is reachable from `Hash.Sha256`, so a consumer of the library does not build
the known-answer tests or the audit.

The pinned counts after stages S1.1 to S1.6 are 422 declarations across twelve
modules: `Hash.Sha256.Vec`, `Spec`, `Impl`, `Lengths`, `Bridge`, `Hex`, `Digest`,
`Api`, `Fast`, `Context`, `Sha224`, and `Kats`. `Hash.Sha256.Audit` is excluded from
its own audit and `Hash.Sha256.Verified` states nothing, so neither is counted.
S1.1–S1.4 had pinned 280 across ten; S1.5 added `Hash.Sha256.Context` and S1.6
`Hash.Sha256.Sha224`.

The conversion of the library modules to Lean's module system moved the count from
422 to 420 without adding or removing an authored declaration. This audit skips
private names (`Name.isInternal`). Three auxiliary matchers minted inside proofs or
a derived `Repr` instance are now private (`Fast.H0_eq.match_1_2`,
`Fast.H0_224_eq.match_1_1`, `instReprAlgorithm.repr.match_1`), and one exposed
definition that used to share a matcher now has its own public one
(`Algorithm.outputBytes.match_1`).

The number of declarations reaching `Classical.choice` is `0`. Ruling R-3
anticipated that `Hex.encode`, `Hex.decode?`, `Digest.toHex` and
`Digest.ofHex?` might have to reach it; they did not. `Hash.Sha256.Hex`
records how that was achieved and what it cost. The package ceiling under
ruling R-11 admits `Classical.choice`, so this `0` is now a recorded property
of the family rather than a condition of the build.
-/

/-- info: sha256 axiom audit: 420 declarations across 12 modules; ceiling [propext, Quot.sound, Classical.choice]; 0 reach Classical.choice; 0 offenders -/
#guard_msgs in
#sha256_axiom_audit

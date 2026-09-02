import Hash

/-!
# `Hash.Verified` — the audited root

The root of the `HashVerified` Lake library and the package's `testDriver`.
It imports the public library and, as each family lands, that family's
verified root: the known-answer tests and the axiom audit whose verdict line
is pinned by `#guard_msgs`.

Two families coexist here under ruling HP-2 (parity later), each under its
own ceiling:

- `Hash.Sha256.Verified` at `[propext, Quot.sound]` (S2);
- `Hash.Sha3.Verified` at `[propext, Classical.choice, Quot.sound]` (S3).

Nothing imported here is reachable from `Hash`, so a consumer of the library
does not build the known-answer tests or the audits.

At S1 there is nothing to verify yet.
-/

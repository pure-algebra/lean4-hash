import Hash.Sha3
import Hash.Sha3.Kats
import Hash.Sha3.KeccakProbe
import Hash.Sha3.BridgeEvidence
import Hash.Sha3.Audit

/-!
# `Hash.Sha3.Verified` — the SHA3 family's audited root

Reached from `Hash.Verified`, the root of the `HashVerified` Lake library.
Moved from foldlab's `formal/fips202/Sha3/Verified.lean` at commit
`64be4b2c`; the closure it pulls in is unchanged — the kernel known-answer
tests, the Keccak-f[1600] probe, the domain-separation evidence, and the
audit.

The pinned line's ceiling and its choice count are the two things ruling R-11
changed. The declaration and module counts were the ones fips202 pinned: 571
declarations across 14 modules.

The conversion of the library modules to Lean's module system moved the count from
571 to 576 without adding or removing an authored declaration. This audit counts
private names under their user names, so auxiliaries that became private are still
counted. The 5 are new auxiliary theorems: one nested proof that a statement and its
proof used to share is now minted twice, once private for the proof and once public
for the exported statement (`Bridge.iota_bridge._proof_2`,
`Bridge.xor_abs_bridge._proof_2`, `Spec.bitsOfState._proof_4`, `Spec.zsub._proof_2`,
`Theorems.rcv_eq_lfsr._proof_2`).
-/

/-- info: sha3 axiom audit: 576 declarations across 14 modules; ceiling [propext, Quot.sound, Classical.choice]; 45 reach Classical.choice; 0 offenders -/
#guard_msgs in #sha3_axiom_audit

# Hash Lean-test routing

This boundary contains executable Lean attacks, witnesses, and the
repository's axiom gate. The repository root rules remain in force;
`docs/AGENT-ROUTING.md` defines the shared assurance and counterexample
route.

## Breaker ownership

A breaker freezes a contract and its red battery before the corresponding
implementation. A builder may repair test elaboration without changing the
attacked statement, witness, or acceptance condition, and does not weaken or
delete a breaker-owned test.

Every counterexample that can alter a declaration or a cutover decision
receives a stable ID in `test/counterexamples/REGISTER.md`. The executable
Lean witness lives under `HashTest/Counterexamples/<Family>/` and is linked
from the register and the owning contract. The witness is kept after the
implementation rejects it, so the repair stays testable.

A frozen red battery is declared in `test/fixtures/trust-gate/known-red.txt`
for the duration of its red phase and removed the moment the builder turns it
green. The trust self-test checks that declaration in both directions.

## Evidence classes

Tests distinguish theorem evidence, finite executable probes, and host
observations. A passing known-answer test does not become a general law: it
is reported as a finite probe over named vectors. Every inequality witness
closes by `decide +kernel`, so it is checked by the Lean kernel with no
compiler in the trust path, and every expected digest comes from a sealed
`.rsp` through the family's `Kats` module rather than from a literal typed
here.

## Audit implementation

`HashTest/Audit/AxiomGate.lean` is the one module in this tree admitted to
the implementation ceiling, by exact name, because `MetaM` reaches
`Classical.choice`. Another audit module is admitted only by adding its exact
name to the gate's list, where a stale entry fails the build.

The gate is exhaustive over the compiled environment rather than a
hand-written theorem list, and it also enforces module closure: a `.lean`
file under `Hash/`, `HashTest/`, or `Gates/` that no root reaches is a gate
failure, not a silently unbuilt file.

Before handoff, run the narrow file directly and the default Lake build, and
quote the pass line from the log file rather than from the console.

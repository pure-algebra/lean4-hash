import Lean

open Lean Elab Command

namespace Sha3.Audit

private def allowedAxioms : List Name := [`propext, `Classical.choice, `Quot.sound]

private def isInternal (n : Name) : Bool :=
  match n with
  | .str _ s =>
      s == "_unsafe_rec" || s.startsWith "_cstage" || s.startsWith "_sparse" ||
        s.startsWith "_lambda" || s.startsWith "_elambda" || s.startsWith "_closed" ||
        s.startsWith "_spec_" || s == "match_1" || s == "eq_def"
  | _ => n.hasMacroScopes

elab "#sha3_axiom_audit" : command => do
  let env ← getEnv
  let mods := env.allImportedModuleNames
  let mut scanned : Nat := 0
  let mut covered : NameSet := {}
  let mut offenders : Array (Name × Array Name) := #[]
  for (n₀, _) in env.constants.toList do
    let some idx := env.getModuleIdxFor? n₀ | continue
    let some m := mods[idx.toNat]? | continue
    unless (`Sha3).isPrefixOf m && m != `Sha3.Audit do continue
    let n := privateToUserName n₀
    if isInternal n then continue
    scanned := scanned + 1
    covered := covered.insert m
    let axioms ← Lean.collectAxioms n₀
    let stray := axioms.filter fun ax => !allowedAxioms.contains ax
    unless stray.isEmpty do offenders := offenders.push (n, stray)
  if scanned < 70 then
    throwError "sha3 axiom audit FAILED: scanned only {scanned} declarations; expected at least 70"
  unless offenders.isEmpty do
    throwError "sha3 axiom audit FAILED: axioms outside allowlist: {offenders}"
  logInfo s!"sha3 axiom audit: {scanned} declarations across {covered.toList.length} modules; allowlist [propext, Classical.choice, Quot.sound]; 0 offenders"

end Sha3.Audit

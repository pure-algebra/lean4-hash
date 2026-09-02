import Sha3.Bridge
import Sha3.Kats

/-!
# Evidence-only bridge closure

This module keeps the known-answer dependency outside the `Sha3` API import closure while
preserving the frozen name and type of `Sha3.Bridge.sha3_ne_prefips_spec`.
-/

namespace Sha3.Bridge

/-- T10-SPEC: the domain-separation suffix changes the frozen spec digest. -/
theorem sha3_ne_prefips_spec :
    Sha3.Spec.keccakC 1024 (Sha3.Spec.bitsOfBytes []) 512 ≠
      Sha3.Spec.SHA3_512 (Sha3.Spec.bitsOfBytes []) := by
  intro h
  apply Sha3.Kats.sha3_ne_prefips
  rw [keccak512_prefips_bridge, sha3_512_bridge]
  unfold Sha3.Spec.sha3_512_bytes
  exact congrArg Sha3.Spec.bytesOfBits h

end Sha3.Bridge

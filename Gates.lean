import Gates.Common
import Gates.Citations
import Gates.TrustSelfTest

/-!
# Gates

Root of the Lean-implemented gate tooling. Entry points live under `bin/`.

`Gates.Sha256` and `Gates.VendorSeal` join this root at S2 and `Gates.Sha3`
at S3: each computes digests through the proved library, so neither can exist
before the library it calls.
-/

import Gates.Common
import Gates.Sha256
import Gates.VendorSeal
import Gates.Citations
import Gates.TrustSelfTest

/-!
# Gates

Root of the Lean-implemented gate tooling. Entry points live under `bin/`.

`Gates.Sha3` joins this root at S3: like `Gates.Sha256` and
`Gates.VendorSeal`, it computes every digest through the proved library, so
it cannot exist before the library it calls.
-/

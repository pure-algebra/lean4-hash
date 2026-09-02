import Gates.Common
import Gates.Cavp
import Gates.Sha256
import Gates.Sha3
import Gates.VendorSeal
import Gates.Citations
import Gates.TrustSelfTest

/-!
# Gates

Root of the Lean-implemented gate tooling. Entry points live under `bin/`.

`Gates.Sha256`, `Gates.Sha3` and `Gates.VendorSeal` each compute every digest
through the proved library, so none of them can exist before the library it
calls. `Gates.Cavp` is the one NIST response-file parser both self-tests
read their pinned vectors with.
-/

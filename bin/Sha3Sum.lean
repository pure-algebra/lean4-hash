import Gates.Sha3

/-- Entry point only; the audited logic is Gates.Sha3.cli. -/
def main (args : List String) : IO UInt32 := Gates.Sha3.cli args

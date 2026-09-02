import Gates.SelfTest

/-- Entry point only; the audited logic is Gates.SelfTest.cli. -/
def main (args : List String) : IO UInt32 := Gates.SelfTest.cli args

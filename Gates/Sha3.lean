import Sha3
import Init.System.IO

/-! File/stdin adapter. IO stays outside the pure `Sha3` namespace. -/

def main (args : List String) : IO UInt32 := do
  if args.length > 1 then
    (← IO.getStderr).putStrLn "usage: sha3_512sum [FILE|-]"
    return 1
  let name := args.headD "-"
  let bytes ← if name == "-" then
      (← IO.getStdin).readBinToEnd
    else
      IO.FS.readBinFile name
  (← IO.getStdout).putStrLn s!"{(Sha3.sha3_512 bytes).toHex}  {name}"
  return 0

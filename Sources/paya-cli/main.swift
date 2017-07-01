import paya_core
import Foundation

/// some command may have '--' prefix, such as '--help'
/// remove them if needed
extension String {
  func removedPrefixString() -> String {
    if self.hasPrefix("--") {
      let index = self.index(self.startIndex, offsetBy: 2)
      return self.substring(from: index)
    }
    if self.hasPrefix("-") {
      let index = self.index(self.startIndex, offsetBy: 1)
      return self.substring(from: index)
    }
    return self
  }
}

func printHelpers() {
  print("\n")
  print("Paya:")
  print("    init [dir] : initialize a directory as website source code")
  print("    help       : get paya help ")
  print("\n")
}

let argv = CommandLine.arguments
let argc = CommandLine.argc

if argc <= 1 {
  print("\n")
  print("missing required parameters, use paya help for details")
  print("\n")
  exit(EXIT_FAILURE)
}

let action = argv[1].removedPrefixString()

switch action {
  case "init": break
  case "help":
    printHelpers()
    break
  default:
    print("\nunrecognized command\n")
    exit(EXIT_FAILURE)
}

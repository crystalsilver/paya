import paya_core
import Foundation

let argv = CommandLine.arguments

for i in argv {
  print("argument: \(i)")
}

let p = Process().currentDirectoryPath

Paya.setWorkerDirectory(directory: p)
payaCreateTemplateProject(dir: nil)

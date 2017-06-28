import Kitura
import paya_core

let router = Router()

let arvc = CommandLine.arguments

for i in arvc {
  print("argument: \(i)")
}

router.get("/") {
  request, response, next in
  response.send("hello world")
  next()
}

Kitura.addHTTPServer(onPort: 3000, with: router)

Kitura.run()

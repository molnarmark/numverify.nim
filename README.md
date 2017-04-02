# Numverify.nim

Numverify.nim is a simple wrapper around the Numverify Phone Number validator REST API.

### Available methods

```nim
proc verify*(client: NumVerifier, number: string): NumVerifyReport
proc verify*(client: NumVerifier, number, countryCode: string): NumVerifyReport
```

### NumVerifyReport

Accessible fields:
```nim
valid*: bool
number*: string
localFormat*: string
internationalFormat*: string
countryPrefix*: string
countryCode*: string
countryName*: string
location*: string
carrier*: string
lineType*: string
```

### Simple Usage
```nim
import numverify

var verifier = newNumVerifier("your-api-key")

if verifier.verify("+2342342342342").valid:
  echo "Number was valid!"
else:
  echo "Number is invalid.."

# You can also access the fields like so:
var verifyResult = verifier.verify("+2342342342342")
echo verifyResult.countryName
```

### Developer

 - Mark Molnar

### License
[MIT](https://opensource.org/licenses/mit-license.php)
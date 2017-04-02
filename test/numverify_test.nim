import numverify

var verifier = newNumVerifier("your-api-key")

if verifier.verify("+2342342342342").valid:
  echo "Number was valid!"
else:
  echo "Number is invalid.."

# You can also access the fields like so:
var verifyResult = verifier.verify("+2342342342342")
echo verifyResult.countryName
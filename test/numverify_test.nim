import numverify

var verifier = newNumVerifier("ce94fe20042e1540d1fd435ca74f9662")

if verifier.verify("+36303234489").valid:
  echo "valid"
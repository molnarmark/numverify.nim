import httpclient, strutils, json

const ENDPOINT = "http://apilayer.net/api/validate"

type
  NumVerifier = object
    apiKey: string

  NumVerifyReport = object
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

proc newNumVerifier*(apiKey: string): NumVerifier = NumVerifier(apiKey: apiKey)

proc generateReport(response: string): NumVerifyReport =
  var jsonResponse = parseJson(response)
  return NumVerifyReport(
    valid: parseBool($jsonResponse["valid"]),
    number: $jsonResponse["number"],
    localFormat: $jsonResponse["international_format"],
    internationalFormat: $jsonResponse["international_format"],
    countryPrefix: $jsonResponse["country_prefix"],
    countryCode: $jsonResponse["country_code"],
    countryName: $jsonResponse["country_name"],
    location: $jsonResponse["location"],
    carrier: $jsonResponse["carrier"],
    lineType: $jsonResponse["line_type"],
  )

proc verify*(client: NumVerifier, number: string): NumVerifyReport =
  var query = "?access_key=$1&number=$2&country_code=&format=1" % [client.apiKey, number]
  var response = getContent(ENDPOINT & query)
  return generateReport(response)

proc verify*(client: NumVerifier, number, countryCode: string): NumVerifyReport =
  var query = "?access_key=$1&number=$2&country_code=$3&format=1" % [client.apiKey, number, countryCode]
  var response = getContent(ENDPOINT & query)
  return generateReport(response)
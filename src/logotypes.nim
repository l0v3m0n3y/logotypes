import asyncdispatch, httpclient, json, strutils
const api = "https://logotypes.dev"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "logotypes.dev",
    "accept": "application/json"
})

proc all_logos*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/all")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc logo_by_name*(name:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/" & name & "/data")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc stoic_quote*(variant:string="wordmark",version:string="black"): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/random/data?variant=" & variant & "&version=" & version)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

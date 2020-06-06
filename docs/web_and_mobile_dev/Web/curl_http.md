# Curl command

## What is it?

curl is a tool to transfer data from or to a server, using one of the supported protocols (DICT, FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, ...). The command is designed to work without user interaction.

## Curl for HTTP scripting

A complete reference of using curl for HTTP scripting can be found [here](https://curl.haxx.se/docs/httpscripting.html).

## Example

```
curl -H "Authorization: JWT eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMSIsImlhdCI6MTUxNjIzOTAyMn0.W26BDfA69R8iD7Cdhtf7FxmgMnD8U9rbYo-N_Gww9TY" -H "Content-Type: application/json" --data "{\"latitude\":40.447755,\"longitude\":-79.939272,\"accuracy\":51,\"altitude\":\"null\",\"altitudeAccuracy\":\"null\",\"heading\":\"null\",\"speed\":\"null\",\"timestamp\":\"2019-06-29T15:46:09.745Z\"}" http://localhost:5000/
```
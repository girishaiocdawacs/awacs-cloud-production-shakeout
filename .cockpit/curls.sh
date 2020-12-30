#! /bin/bash


curl -kSs -X POST \
  https://qa.awacscloud.tech/authserver/oauth/token \
  -u "trinity:trinity" \
  -F grant_type=password \
  -F username=admin \
  -F password=admin1234 | json_pp



curl -kiSs -X POST \
  https://qa.awacscloud.tech/authserver/oauth/refresh_token \
  -u "trinity:trinity" \
  -F grant_type=client_credentials \ 
  -F client_id=trinity \
  -F client_secret=trinity \
  -F "refresh_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsicmVzb3VyY2Utc2VydmVyLXJlc3QtYXBpIl0sInVzZXJfbmFtZSI6ImFkbWluIiwic2NvcGUiOlsicmVhZCIsIndyaXRlIl0sImF0aSI6Ijc3YzdjMTg2LTI4YTItNDNhMS1iOGRjLWE3MjQ1YjliYWNkYyIsImV4cCI6MTYwODg2MjAwMywiYXV0aG9yaXRpZXMiOlsiU1lTVEVNIiwib3JkZXJfcmVhZCIsIm9yZGVyX2NyZWF0ZSIsInByb2R1Y3RfdXBkYXRlIiwib3JkZXJfZGVsZXRlIiwicm9sZV9wcm9kdWN0X29yZGVyX3JlYWRlciIsIlVTRVIiLCJvcmRlcl91cGRhdGUiLCJwcm9kdWN0X3JlYWQiLCJwcm9kdWN0X2NyZWF0ZSIsInByb2R1Y3RfZGVsZXRlIl0sImp0aSI6ImY0MmVkMjgzLTY1YWItNDAwYS1iOTBjLTg2ZWM4MDcwNDFjNyIsImNsaWVudF9pZCI6InRyaW5pdHkifQ.2yZF1VjxLEB0-N0rndpL3UKuS4Km1qKLrOH4ENsUF24"



curl -kiSs -X POST \
  https://qa.awacscloud.tech/authserver/oauth/authorize \
  -F response_type=code \
  -F client_id=trinity \
  -F client_secret=trinity \
  -F "redirect_uri=http://smartservice.aiocdawacs.com/" 



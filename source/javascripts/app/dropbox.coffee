client = new Dropbox.Client
  key: "NnJ9pQB7wmA=|coeMAjY9oRRxEBWOaw0tdq1JRSoD95p4FGnAzGAWJA==", sandbox: true

driver = new Dropbox.Drivers.Redirect
  rememberUser: true

client.authDriver(driver)

client.authenticate (error, client) ->
  SleeperAgent.persistence = client

  SleeperAgent.init()

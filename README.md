# PWS-ManAccount-from-List
Writes a managed account to an existing managed system based on a provided csv of system and account
uses the psrun2 client, so make sure you have that avaialable /added to your path

Will use the listsystems command to work out the Managaed System ID needed for the create managed account command
Cross references the csv so that it only writes to systems listed there and with the account listed in the same row.

passwords all set to 'blank' 

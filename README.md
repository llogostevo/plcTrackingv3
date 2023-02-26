# plcTrackingv3

So far completed

Login / Register / Logout
- includes a  static folder - login css and register css using bootsrap
- when going to the index there is a check to see if the user is logged in before it displays content (this will likley need changing)

templates setup
- base template (potentially needs tidying up as some content isn't required for all pages e.g. login)
- 

database
- setup with the schema identified
- need to 
blueprints
- auth.py setup for login

- need to setup blueprints for other actions with site, need to get an understanding of what these actions are however

setup:
step 1 - create folder for project
step 2 - pull from github
step 3 -  run envirnonment
- source ./env/bin/activate    

(to setup environment in first place use: python3 -m venv env)
(to setup DB and reapply data: python3 -m flask --app flaskapp init-db) 

to run each time
- start envinronment: source ./env/bin/activate

- python -m flask --app flaskapp --debug run
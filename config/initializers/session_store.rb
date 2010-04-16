# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dtc_session',
  :secret      => '85344da09b5f1a6c9ebbf7922cdc3e2e7e7e5b453d74bf19b0de047766bb4ca610c1db316cfedbb811c2646a6a833a1b6013368193860462e93b0867fd7fa179'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

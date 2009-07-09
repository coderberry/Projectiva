# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_taskbus_session',
  :secret      => '2cc2874ad64eb2b99e683963daafc9c01c179a5363c4d9e17683ea0e6fa4d4b3c609accd80bb9e2662607989d4bb8ec3c8c6a8e7dce350fa84f773d7b9010e24'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

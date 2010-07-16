# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lis_session',
  :secret      => 'bf0e64aef82d4a78df75910230e7225674bf7ef261d5e2c703d8c5e5f2ac9f532f6760068f36b7c99a8e791eebd01984a4d75f8bbeb32979552de85af1aafd28'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

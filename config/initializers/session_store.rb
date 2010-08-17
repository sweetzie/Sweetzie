# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sweetzie_session',
  :secret      => '9ea7046613ec00524e38ee36550ef59c30ba317d8414e0bf70cbb862464f094624fb8e69cee0df51b757c3d7a27c8ef075d0e9429b937d1e1c35aca4e38940f7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

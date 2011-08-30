# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_omniauth-demo_session',
  :secret      => 'b56432f3ae2003c86e4d2ef6dcd4ff2ff3780bb32d5cc137f0414a984c81c6a5ffbfec66c8459d39cd7211253b3eb05586d81b9effdafebc86b4f36871b16272'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

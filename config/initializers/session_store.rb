# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_xinghai_session',
  :secret      => '6c2b1e24af352c33f2cd3209fae65c9592b57d7c30ed88cb4763066e27d251184e35381dedb84b1e669239d8fba6a061f71118eb764117b7997fb17d908a5797'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

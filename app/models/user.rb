class User < ApplicationRecord
  has_secure_password
end

# post to localhost/authenticate with the body has key values of email and password
# then send a post request and it give you a token
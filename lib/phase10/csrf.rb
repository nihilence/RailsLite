# module Phase10
#
#   module ForgeryProtection
#
#     class AuthToken
#       def initialize(req)
#         cookie = res.find {|c| c.name == "_crsf"}
#         @token= cookie.nil? ? SecureRandom.base64(32) : JSON.parse(cookie.value)
#       end
#
#
#       def verify_auth_token(req)
#
#       end
#
#
#       def store_auth_token(res)
#
#       end
#     end
#   end
# end

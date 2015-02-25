require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      cookie = req.cookies.find { |c| c.name == '_rails_lite_app'}
      @hash = cookie.nil? ? {} : JSON.parse(cookie.value)
    end

    def [](key)
      @hash[key]
    end

    def []=(key, val)
      @hash[key] = val
    end

    # serialize the hash into json and save in a cooki
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app', @hash.to_json)
    end
  end
end

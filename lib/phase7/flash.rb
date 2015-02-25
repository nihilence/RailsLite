module Phase7
  class Flash
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @persist = FlashHash.new
      @flash_now = FlashHash.new

      cookie = req.cookies.find { |c| c.name == '_rails_lite_app_flash'}
      @flash_now.hash = JSON.parse(cookie.value) if cookie
    end

    def now
      @flash_now
    end

    def [](key)
      @flash_now[key.to_s] || @persist[key.to_s]
    end

    def []=(key, val)
      @persist[key.to_s] = val
    end

    # serialize the flash into json and save in a cookie
    # add to the responses cookies
    def store_flash(res)
      res.cookies << WEBrick::Cookie.new('_rails_lite_app_flash', @persist.to_json)
    end
  end

  class FlashHash

    attr_accessor :hash

    def initialize
      @hash = {}
    end

    def [](key)
      @hash[key.to_s]
    end

    def []=(key,val)
      @hash[key.to_s] = val
    end

    def to_json
      @hash.to_json
    end
  end

end

require_relative '../phase7/controller_base'
require_relative './url_helpers'
require_relative './router'


module Phase9

  class ControllerBase<Phase7::ControllerBase
    include URLHelpers
  end

end

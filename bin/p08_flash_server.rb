require 'webrick'
require_relative '../lib/phase7/controller_base'
require_relative '../lib/phase7/flash'
require_relative '../lib/phase6/router'

class FlashController < Phase7::ControllerBase
  def index
    flash[:test] = ["test"]
    render(:index)
  end


end

router = Phase6::Router.new
router.draw do
  get Regexp.new("^/flash$"), FlashController, :index
end

server = WEBrick::HTTPServer.new(Port: 3000)
server.mount_proc('/') do |req, res|
  FlashController.new(req, res).index
end

trap('INT') { server.shutdown }
server.start

# module Phase10
#
#   class ControllerBase<Phase9::ControllerBase
#     include ForgeryProtection
#
#     def redirect_to(url)
#       super(url)
#       auth_token.store_token(@res)
#     end
#
#     def render_content(content, type)
#       super(content,type)
#       auth_token.store_token(@res)
#     end
#
#     def auth_token
#
#     end
#   end
#
# end

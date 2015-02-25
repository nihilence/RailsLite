module Phase9

  module URLHelpers

    def link_to(label, path)
      "<a href='#{path}'>#{label}</a>"
    end

    def button_to(label, path, options={})
      head ="<form action='#{path}' method='post'>"
      button= "<input type='submit' value='#{label}'>"
      form = "</form>"

      if options.any?
        method ="<input type='hidden' name='_method' value='#{options[:method]}'>"
      else
        method =""
      end
      head+method+button+form
    end
  end

end

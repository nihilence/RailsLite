# RailsLite

##Core Functionality

### Basic render and redirect_to
- [X] render_content populates response content_type and body
- [X] redirect_to populates response status and location
- [X] render creates filepath to a template, i.e.'/views/cats_controller/show.html.erb'
- [X] render creates ERB instance with filepath, evaluates by binding local variables
### Session method and hash
- [X] session method in controller base allows insertion into session hash
- [X] session parses request cookie into session hash if it exists, else
    the session hash is an empty hash
- [X] session has store_session method which populates response cookie with session hash
- [X] render and redirect_to methods overridden to store the session
### Params method and hash
- [X] params instance created in controller on initialization
- [X] params hash populated with route parameters, as well as decoded request body
    and query string
- [X] params returns values as strings
### Router and routes
- [X] route objects have attributes such as the controller they are associated with,
    the http method they use, the regex url pattern to match and the controller
    action it takes
- [X] request path is matched against the pattern and the http method is confirmed
    identical to ensure the correct route is chosen
- [X] route run pulls route_params from request, creates new controller and invokes action
- [X] controller base invoke action calls the method matching the argument name on itself
    then renders the appropriate template unless the response was already built
- [X] router's routes array is populated with standard http routes with add_route
- [X] router draw method evaluates proc allowing multiple routes to be created at once
- [X] router searches routes for match to request, returns 404 error if none exists
    and runs the route otherwise

##Bonus

### Flash
- [X] flash method in controller base constructs a flash object if one doesn't exist
- [X] flash parses cookie for appropriate key and stores value in flash hash
- [X] flash only persists messages for one additional request
- [X] flash now doesn't persist the message for an additional request

### URL helpers
- [X] link_to and button_to creates html
- [X] routes modified to create a url helper in the controller which returns the
    correct path

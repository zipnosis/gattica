module Gattica
  module Settings

    # Google server to connect to
    #
    # You may need to change this if you use a proxy server.  However, I have not
    # tested using a proxy.... YMMV
    SERVER = 'www.google.com'

    # Use a secure connection?
    #
    # If set to true, Gattica will use SSL_PORT or else it will use NON_SSL_PORT.
    #
    # === Example:
    # +USE_SSL = true+::  # Always use a secure connection
    USE_SSL = true
    SSL_PORT = 443
    NON_SSL_PORT = 80

    # Net::HTTP timeout in seconds
    #
    # Increase the timeout setting if you have over 100 profiles.
    #
    # === Example:
    # +TIMEOUT = 300+::   # Increase timeout to 5 minutes.
    TIMEOUT = 100

    DEFAULT_ARGS = {
        :start_date => nil,
        :end_date => nil,
        :dimensions => [],
        :metrics => [],
        :filters => [],
        :sort => []
    }

    DEFAULT_OPTIONS = {
        :email => nil,        # eg: 'email@gmail.com'
        :password => nil,     # eg: '$up3r_$ekret'
        :token => nil,
        :profile_id => nil,
        :debug => false,
        :headers => {},
        :logger => Logger.new(STDOUT)
    }

    FILTER_METRIC_OPERATORS = %w{ == != > < >= <= }
    FILTER_DIMENSION_OPERATORS = %w{ == != =~ !~ =@ ~@ }
    
  end
end
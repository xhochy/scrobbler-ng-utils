module Scrobbler
  class Base
    @@fetch_http_lastcall = 0
    class << self
      alias :orig_fetch_http :fetch_http
      def fetch_http(request_method, paramlist)
        now = ("%10.6f" % Time.now.to_f).to_f
        threshold = now - 1
        if (@@fetch_http_lastcall > threshold) then
          sleep(now - @@fetch_http_lastcall)
        end
        @@fetch_http_lastcall = now
        return orig_fetch_http(request_method, paramlist)
      end
    end
  end
end
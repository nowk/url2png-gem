module Url2png
  module Cache
    def self.url(image_url, cache)
      cache === true ? cache_url(image_url) : image_url
    end


  private

    def self.cache_url(url_to_cache)
      require "httpclient"

      client  = HTTPClient.new
      content = client.get(url_to_cache, :follow_redirect => false)
      content.header.get('Location').flatten.last
    end
  end
end

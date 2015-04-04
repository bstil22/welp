if Rails.env = 'development'
     ENV["ELASTICSEARCH_URL"] = "http://localhost:3000"
end

Searchkick.client = Elasticsearch::Client.new(hosts: ["localhost:3000", "localhost:9201"], retry_on_failure: true)
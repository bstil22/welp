if Rails.env == 'development'
ENV["ELASTICSEARCH_URL"] = "http://localhost:9200"
end
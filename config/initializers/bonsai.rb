if ENV[‘BONSAI_URL’]
     Searchkick.client = Elasticsearch::Client.new({url: ENV[‘BONSAI_URL’], logs: true})
end
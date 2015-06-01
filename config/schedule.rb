every :day, :at => '12:01am' do
  rake "fetcher"
  rake "request"
end

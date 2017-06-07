require 'net/http'

class Spider
  HOST_URL = 'https://en.wikipedia.org'

  def initialize(date)
    @date = date
  end


  def crawl
    events_page = fetch_page(date_to_href)

    # obtain list of hrefs of events for give date
    hrefs = Parser.new(events_page, @date).href_list

    # for each href, go to the event page and obtain article summary
    events_data = []
    hrefs.each do |href|
      event_page = fetch_page(href)
      # return event_page
      data = Parser.new(event_page, @date).event_data
      events_data.push(data)
    end
    events_data
  end

  private

  def date_to_href
    '/wiki/Portal:Current_events/' + @date.strftime('%B_%Y') + "#" + @date.strftime('%Y_%B_%-d')
  end

  def fetch_page(href)
    uri = URI.parse(HOST_URL + href)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.body
  end
end

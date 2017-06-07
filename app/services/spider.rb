require 'net/http'

class Spider
  HOST_URL = 'https://en.wikipedia.org'

  def initialize(date)
    @date = date
  end


  def run
    events_page = fetch_page(date_to_href)

    # obtain list of hrefs of events for give date
    hrefs = Parser.new(events_page, @date).parse_hrefs

    # for each href, go to the event page and obtain article summary
    summaries = []
    hrefs.take(1).each do |href|
      event_page = fetch_page(href)
      # return event_page
      data = Parser.new(event_page, @date).parse_article
      summaries.push(data)
    end
    summaries
  end

  private

  def date_to_href
    '/wiki/Portal:Current_events/' + @date.strftime('%B_%Y') + "#" + @date.strftime('%Y_%B_%-d')
  end

  def parse_events(page)

  end

  def parse_event(page)

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

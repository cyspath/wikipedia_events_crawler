class Event < ActiveRecord::Base
  def self.for_date(date)
    events = where(date: date)
    events.empty? ? fetch_events(date) : events
  end

  def self.fetch_events(date)
    Spider.new(date).crawl.map do |data|
      create(data)
    end
  end
end

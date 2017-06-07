class Parser
  HTML_TD_DESCRIPTION = { open: '<td class="description">', close: '</td>' }
  HTML_LI = { open: '<li', close: '</li>' }

  def initialize(page, date)
    @page = page.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_')
    @date = date
  end

  def href_list
    extract_links
  end

  def event_data
    {
      date: @date,
      title: extract_title,
      summary: extract_summary,
      image_url: extract_image_url
    }
  end

  private

  def extract_links
    # find identifier mark first, this is id = date
    identifier = 'id="' + @date.strftime('%Y_%B_%-d') + '"'
    id_idx = @page.index(identifier)

    # define start and end index of the page
    i = @page[id_idx..-1].index(HTML_TD_DESCRIPTION[:open]) + id_idx
    j = @page[i..-1].index(HTML_TD_DESCRIPTION[:close]) + i + HTML_TD_DESCRIPTION[:close].length

    # each time we see a <li> we will then look for the first link and add to list
    links = []
    while i < j
      current = @page[i..i + HTML_LI[:open].length - 1]
      if current == HTML_LI[:open]
        href_i = @page[i..j].index('href="') + i + 6
        href_j = @page[href_i..j].index('"') + href_i - 1
        links.push(@page[href_i..href_j])
      end
      i += 1
    end
    links
  end

  def extract_title
    find_tag_property('id="firstHeading"', '>', '<')
  end

  def extract_summary
    a = find_tag_property('class="mw-parser-output"', '<p>', '<div id="toc"')
  end

  def extract_image_url
    find_tag_property('<img', 'src="', '"')[2..-1]
  end

  def find_tag_property(identifier, hook, tail)
    i = @page.index(identifier)
    content_i = @page[i..-1].index(hook) + hook.length + i
    content_j = content_i
    while content_j < @page.length
      if @page[content_j] == tail
        break
      end
      content_j += 1
    end
    @page[content_i..content_j - 1]
  end
end

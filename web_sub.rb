require 'nokogiri'

# мой id канала UC7fke63WXyQ0P_EYtqgX4sw

doc = Nokogiri::Slop <<-EOXML
  <feed xmlns:yt="http://www.youtube.com/xml/schemas/2015" xmlns="http://www.w3.org/2005/Atom">
    <link rel="hub" href="https://pubsubhubbub.appspot.com"/>
    <link rel="self" href="https://www.youtube.com/xml/feeds/videos.xml?channel_id=CHANNEL_ID"/>
    <title>YouTube video feed</title>
    <updated>2015-04-01T19:05:24.552394234+00:00</updated>
    <entry>
      <id>yt:video:VIDEO_ID</id>
      <yt:videoId>VIDEO_ID</yt:videoId>
      <yt:channelId>CHANNEL_ID</yt:channelId>
      <title>Video title</title>
      <link rel="alternate" href="http://www.youtube.com/watch?v=VIDEO_ID"/>
      <author>
        <name>Channel title</name>
        <uri>http://www.youtube.com/channel/CHANNEL_ID</uri>
      </author>
      <published>2015-03-06T21:40:57+00:00</published>
      <updated>2015-03-09T19:05:24.552394234+00:00</updated>
    </entry>
  </feed>
EOXML

# doc = Nokogiri::XML(xml)
author = doc.xmlns.entry.author.name.content
puts doc
puts author

module FeedParser
  module_function

  def parse; end
end

module WebSub
  module_function

  def subscribe
    # POST url - https://pubsubhubbub.appspot.com/subscribe
    # POST FORM
    # hub.callback: https://test.com
    # hub.mode: subscribe
    # hub.topic: https://www.youtube.com/feeds/videos.xml?channel_id=test
    # hub.verify: async/sync
    # hub.verify_token: token [optional]
    # hub.secret: secret [optional]
    # (seconds) hub.lease_numbers: 123 [optional]
  end
end

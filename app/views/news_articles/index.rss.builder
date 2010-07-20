##
# RSS Feed for News Articles
#

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
    xml.channel do
        xml.title "News"
        xml.description "Recent news form the Legume Information System."
        xml.link news_articles_url(:rss)
    
        for article in @rss
            xml.item do
                xml.title article.title
                xml.description article.body
                xml.pubDate article.timestamp.to_s(:rfc822)
                xml.link news_article_url(article)
                xml.guid news_article_url(article)
            end
        end
    end
end
# SCRAPE acmepackingcompany.com
import scrapy

class GBSpider(scrapy.Spider):
    name = "GB"
    start_urls = [
        "https://web.archive.org/web/20110818054720/http://www.acmepackingcompany.com/"
    ]
    # def getTotalHTML(self, response):
    #     page = response.url.split("/")[-2]
    #     filename = 'gb-%s.html' % page
    #     with open(filename, 'wb') as f:
    #         f.write(response.body)
    #     self.log('Saved file %s' % filename)

    def parse(self, response):
        for p in response.xpath('//*[@class="entry-body"]//p/text()'):
            yield {
                'line': p.getall()
            }

# SELECT ALL PARAGRAPH TEXTS FROM 'ENTRY-BODY' CLASSES
# response.xpath('//*[@class="entry-body"]//p/text()').getall()
# EOF

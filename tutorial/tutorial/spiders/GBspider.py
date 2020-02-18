# SCRAPE acmepackingcompany.com
import scrapy

class GBSpider(scrapy.spider):
    name = "GB"
    test_url = [
        "https://web.archive.org/web/20110818054720/http://www.acmepackingcompany.com/"
    ]
    def parse(self, response):
        page = response.url.split("/")[-2]
        filename = 'gb-%s.html' % page
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log('Saved file %s' % filename)




# -*- coding: utf-8 -*-
"""
SCRAPE acmepackingcompany.com
"""
import scrapy
# TODO: CLEAN UP DIRECTORY!

# <div class = "entry-body">
class GBSpider(scrapy.Spider):
    name = "GB"
    start_urls = [
        "https://web.archive.org/web/20110818054720/http://www.acmepackingcompany.com/"
    ]


    def parse(self, response):
        for p in response.xpath('//*[@class="entry-body"]//p/text()'):
            yield {
                'line': p.getall()
            }

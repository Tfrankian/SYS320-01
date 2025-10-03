#$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.13/ToBeScraped.html
#$scraped_page.Links.Count

#$scraped_page.Links

#$scraped_page.Links | Select outerText , href | Format-List

#$h2s = $scraped_page.Parsedhtml.body.getElementsByTagName("h2") | select outerText
#$h2s

$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { 
    $_.getAttributeNode("class").Value -ilike "div-1"} | select innerText

$divs1
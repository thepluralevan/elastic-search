##&lt;elastic-search&gt;

A`elastic-search` is an element that makes a search API request to an elasticsearch
server via the standard elasticsearch javascript api.

Example:
```html
<elastic-client 
  config='{"host": "http://localhost:9200"}'>
</elastic-client>

<elastic-search 
  client="[[client]]"
  index="ads"
  results={{data}}
  lastError="{{error}}">
</elastic-search>


## Note
To run the demo with polyserve, first install elasticsearch on your local host, start elasticsearch on port 9200, and then execute the import_test_data.sh shell script found in the data directory
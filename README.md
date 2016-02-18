##&lt;elastic-search&gt;

A`elastic-search` is an element that makes a search API request to an elasticsearch
server via the standard elasticsearch javascript api.

Example:
```html
    <template is="dom-bind">
      <elastic-client 
        config='{"host": "http://localhost:9200"}'
        client="{{esclient}}"
        cluster-status="{{my-status}}">
      </elastic-client>

      <elastic-search 
        client="[[esclient]]"
        index="ads"
        query='{"query": {"match_all": {}}}'
        results="{{data}}"
        lastError="{{error}}">
      </elastic-search>

      <span>hits: {{data.hits.total}}</span>
      <template is="dom-repeat" items={{data.hits.hits}} 
        as=item>
        <p>{{item._source.title}}</p>
      </template>
    </template>
```

## Note
To run the demo with polyserve, first install elasticsearch on your local host, start elasticsearch on port 9200, and then execute the import_test_data.sh shell script found in the data directory

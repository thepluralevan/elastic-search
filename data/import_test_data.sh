#!/usr/bin/env bash

echo 'removing ads index ...'

curl -XDELETE localhost:9200/ads > /dev/null 2>&1

echo 'creating ads index ...'
curl -XPUT localhost:9200/ads -d '
{
  "mappings" : {
    "_default_":{
        "_timestamp" : {
            "enabled" : true,
            "store" : true
        }
      }
    },
    "ad" : {
      "properties" : {
        "age" : {
          "type" : "long"
        },
        "city" : {
          "type" : "string",
          "index": "not_analyzed"
        },
        "date" : {
          "type" : "date"
        },
        "email" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "ethnicity" : {
          "type" : "string"
        },
        "eye_color" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "full_name" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "hair_color" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "height" : {
          "type" : "long"
        },
        "id" : {
          "type" : "long"
        },
        "ip_address" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "phone" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "smokes" : {
          "type" : "boolean"
        },
        "state" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "title" : {
          "type" : "string"
        },
        "url" : {
          "type" : "string"
        },
        "username" : {
          "type" : "string",
          "index" : "not_analyzed"
        },
        "weight" : {
          "type" : "long"
        }
      }
    }
  }
}
';

echo
echo 'importing mock ads data set into elasticsearch ...'

curl -XPUT localhost:9200/_bulk --data-binary @ads5k_es.json

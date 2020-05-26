# Reindexer sample

# Build and run

```shell script
make run
``` 

**Expected out**
```shell script
NamespaceImpl::NamespaceImpl (items)
Index::Index ('-tuple',-,string)  
Namespace::updateItems(items) delta=1
Loaded index structure(version 0) of namespace 'items'
string '-tuple' json:""

Loading items to 'items' from storage
[items] WAL initalized lsn #-1
[items] Done loading storage. 0 items loaded (0 errors ), lsn #-1, total size=0M, dataHash=0
Index::Index ('id',,int64)  ,pk
Namespace::updateItems(items) delta=1
Namespace::saveIndexesToStorage (items)
Namespace::saveReplStateToStorage (items)
Index::Index ('name',,string)  
Namespace::updateItems(items) delta=1
Namespace::saveIndexesToStorage (items)
Namespace::saveReplStateToStorage (items)
Index::Index ('articles',,int64)  ,array
Namespace::updateItems(items) delta=1
Namespace::saveIndexesToStorage (items)
Namespace::saveReplStateToStorage (items)
Index::Index ('year',tree,int64)  
Namespace::updateItems(items) delta=1
Namespace::saveIndexesToStorage (items)
Namespace::saveReplStateToStorage (items)
ReindexerImpl::syncSystemNamespaces (#config,namespaces)
Updated TagsMatcher of namespace '#config' on modify:
tags: [0:type 1:profiling 2:queriesperfstats 3:queries_threshold_us 4:perfstats 5:memstats 6:activitystats 7:namespaces 8:namespace 9:log_level 10:lazyload 11:unload_idle_threshold 12:join_cache_mode 13:start_copy_policy_tx_size 14:copy_policy_multiplier 15:tx_size_to_always_copy 16:optimization_timeout_ms 17:replication 18:role 19:master_dsn 20:cluster_id 21:force_sync_on_logic_error 22:force_sync_on_wrong_data_hash 23:action 24:command 25:optimization_sort_workers ]
paths: [type(1):type(1) ]
Saving tags of namespace #config:
tags: [0:type 1:profiling 2:queriesperfstats 3:queries_threshold_us 4:perfstats 5:memstats 6:activitystats 7:namespaces 8:namespace 9:log_level 10:lazyload 11:unload_idle_threshold 12:join_cache_mode 13:start_copy_policy_tx_size 14:copy_policy_multiplier 15:tx_size_to_always_copy 16:optimization_timeout_ms 17:replication 18:role 19:master_dsn 20:cluster_id 21:force_sync_on_logic_error 22:force_sync_on_wrong_data_hash 23:action 24:command 25:optimization_sort_workers ]
paths: [type(1):type(1) ]
SELECT * FROM items LIMIT 0
Got 0 items in 8 µs [prepare 1 µs, select 0 µs, postprocess 4 µs loop 1 µs, general sort 0 µs], sortindex -
-scan: 1 idsets, 0 comparators, cost 0, matched 0, SingleRange(range;,)
Query returned: []; total=0
Saving tags of namespace items:
tags: [0:ID 1:Name 2:Articles 3:Year ]
paths: [ID(1):id(1) Name(2):name(2) Articles(3):articles(3) Year(4):year(4) ]
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (#config)
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (items)
Namespace::saveReplStateToStorage (items)
SELECT * FROM items WHERE id = 40 LIMIT 1
Got 1 items in 14 µs [prepare 4 µs, select 3 µs, postprocess 4 µs loop 2 µs, general sort 0 µs], sortindex -
id: 1 idsets, 0 comparators, cost 1, matched 1, SingleIdset(,)
Query returned: [40]; total=0
Found document: {40 Vasya [61 11] 2005}
Namespace::optimizeIndexes(#namespaces) enter
IndexStore::Commit (-tuple) 0 uniq strings
Namespace::optimizeIndexes(#namespaces) leave 
Namespace::optimizeIndexes(#memstats) enter
IndexStore::Commit (-tuple) 0 uniq strings
IndexStore::Commit (items_count) 0 uniq strings
IndexStore::Commit (data_size) 0 uniq strings
IndexStore::Commit (total.data_size) 0 uniq strings
IndexStore::Commit (total.indexes_size) 0 uniq strings
IndexStore::Commit (total.cache_size) 0 uniq strings
Namespace::optimizeIndexes(#memstats) leave 
SELECT *, COUNT(*) FROM items WHERE name = 'Vasya' AND year > 2020 AND articles IN (6,1,8) ORDER BY 'year' LIMIT 10
Got 10 items in 8303 µs [prepare 80 µs, select 6 µs, postprocess 3 µs loop 8212 µs, general sort 429 µs], sortindex -
articles: 3 idsets, 0 comparators, cost 17607, matched 5782, Forward(btree;,btree;,btree;,)
name: 1 idsets, 0 comparators, cost 100000, matched 5782, SingleIdset(btree;,)
year: 29 idsets, 0 comparators, cost 1.67806e+06, matched 5615, Forward(btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,btree;,)
Query returned: [502,2464,2724,5995,6406,7550,8935,9700,10603,10698]; total=3430
Found 3430 total documents, first 10 documents:
{502 Vasya [21 6] 2021}
{2464 Vasya [67 6] 2021}
{2724 Vasya [6 86] 2021}
{5995 Vasya [22 8] 2021}
{6406 Vasya [6 58] 2021}
{7550 Vasya [48 1] 2021}
{8935 Vasya [80 8] 2021}
{9700 Vasya [9 1] 2021}
{10603 Vasya [62 8] 2021}
{10698 Vasya [46 1] 2021}
```

# Manual build

**Open shell in docker container**
```shell script
make bash
``` 

**Build**
```shell script
make build-sample
``` 

**Run**
```shell script
./sample
``` 

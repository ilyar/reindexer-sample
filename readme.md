# Reindexer sample

# Build and run

```shell script
make run
``` 

**Expected out**
```shell script
Warning: Used Reindexer client version: v2.7.1 with library version: v2.8.0. It is strongly recommended to sync client & library versions
2020/05/23 12:46:27 NamespaceImpl::NamespaceImpl (items)
2020/05/23 12:46:27 Index::Index ('-tuple',-,string)  
2020/05/23 12:46:27 Namespace::updateItems(items) delta=1
2020/05/23 12:46:27 Loaded index structure(version 0) of namespace 'items'
string '-tuple' json:""
2020/05/23 12:46:27 Loading items to 'items' from storage
2020/05/23 12:46:27 [items] WAL initalized lsn #-1
2020/05/23 12:46:27 [items] Done loading storage. 0 items loaded (0 errors ), lsn #-1, total size=0M, dataHash=0
2020/05/23 12:46:27 Index::Index ('id',,int64)  ,pk
2020/05/23 12:46:27 Namespace::updateItems(items) delta=1
2020/05/23 12:46:27 Namespace::saveIndexesToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Index::Index ('name',,string)  
2020/05/23 12:46:27 Namespace::updateItems(items) delta=1
2020/05/23 12:46:27 Namespace::saveIndexesToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Index::Index ('articles',,int64)  ,array
2020/05/23 12:46:27 Namespace::updateItems(items) delta=1
2020/05/23 12:46:27 Namespace::saveIndexesToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Index::Index ('year',tree,int64)  
2020/05/23 12:46:27 Namespace::updateItems(items) delta=1
2020/05/23 12:46:27 Namespace::saveIndexesToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Saving tags of namespace items:
tags: [0:ID 1:Name 2:Articles 3:Year ]
paths: [ID(1):id(1) Name(2):name(2) Articles(3):articles(3) Year(4):year(4) ]
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (#config)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:27 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:28 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:28 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:28 Namespace::saveReplStateToStorage (items)
2020/05/23 12:46:28 Namespace::saveReplStateToStorage (items)
Found document: {40 Vasya [79 36] 2025}
Found 3392 total documents, first 10 documents:
{87 Vasya [87 8] 2021}
{129 Vasya [91 1] 2021}
{1748 Vasya [99 6] 2021}
{2556 Vasya [8 74] 2021}
{3592 Vasya [6 47] 2021}
{3744 Vasya [41 8] 2021}
{4662 Vasya [38 8] 2021}
{5969 Vasya [17 1] 2021}
{6158 Vasya [1 24] 2021}
{7407 Vasya [1 93] 2021}
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

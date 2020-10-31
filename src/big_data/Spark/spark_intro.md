# Introduction to Spark

I was introduced to Spark as part of my Scala class taught at EPFL by Martin Odersky, the creator of Scala himself. 

**Spark** is an Apache project advertised as “lightning fast cluster computing”. It provides a faster and more general data processing platform and has a thriving open-source community and is the most active Apache project at the moment.

The goal of this article is to outline the most important concepts in Spark with hands on code. It is not meat to be comprehensive but is rather filled with tips and tricks from my experience using Spark. 
Whenever possible I will try using Scala as it is the most adapted language to use Spark with. 
Pyspark, the Python library for using Spark, will also be introduced in this article.

## World Count in Spark

World Count is the 'Hello World' of Big Data. In Scala it is as compact as:

```
sparkContext.textFile("hdfs://...")
.flatMap(line => line.split(" ")) 
.map(word => (word,1))
.reduceByKey(_ +_) 
.saveAsTextFile("hdfs://...")
```


mongod --bind_ip 127.0.0.1 --port 27017 --logpath log/mongod.log --dbpath data/db --fork
mongod -f mongod.conf

mongod --port=37019 --fork --dbpath=/opt/mongodb/rs1-37019 --logpath=/opt/mongodb/rs1-37019/mongod.log --replSet=rs1 --oplogSize=512 --auth --keyFile=/mongodb/rs1.key

mongod --port=37018 --fork --dbpath=/opt/mongodb/rs1-37018 --logpath=/opt/mongodb/rs1-37018/mongod.log --replSet=rs1 --oplogSize=512 --auth --keyFile=/mongodb/rs1.key

mongod --port=37017 --fork --dbpath=/opt/mongodb/rs1-37017 --logpath=/opt/mongodb/rs1-37017/mongod.log --replSet=rs1 --oplogSize=512 --auth --keyFile=/mongodb/rs1.key

mongod --port=30001 --fork --dbpath=/opt/mongodb/arb-30001 --logpath=/opt/mongodb/arb-30001/mongod.log --replSet=rs1 --keyFile=/mongodb/rs1.key

db.auth('dbname','******')
db.stats();
db.serverBuildInfo();
db.serverStatus();
use admin;
db.createUser({user:"admin",pwd:"admin",roles:["root"]})
db.source_collection.find().forEach( function(doc) { db.dest_collection.insert(doc); } ); # alternative for copyTo
db.system.users.find().pretty()
db.createUser({user:"foobar", pwd:"foobar", roles:[{role: "readWrite", db: "foobar"}]})
db.system.users.remove({user:"foobar"})
db.shutdownServer();

db.foobar.update({fooId:'122333444455555'},{$set:{"fooDetail" : {"fooName":{"abbaName":"ateens"}}}})

db.foobar.update({fooId:'122333444455555'},{$set:{"fooDetail.shortName" : ""}})

db.foobar.update({fooId:'122333444455555'},{$set:{"fooDetail" : {"fooName":""}}})

db.foobar.update({fooId:'122333444455555'},{$set:{"fooDetail" : ""}})

db.foobar.update({fooId:'122333444455555'},{$unset:{"fooDetail.fooName.abbaName" : ""}})

for (var i=0; i<100000; i++) {
	var rand=parseInt(i*Math.random());
	db.person.insert({'name':'cc'+i, 'age':i});
}

show dbs;
db.stats(1024);
db.serverBuildInfo();
db.serverStatus();
use admin;

db.users.find({ts:{$gte:Timestamp(1475113364, 2)}})
db.users.find({name: {$exists: true}})

// 获取某个文档的大小
db['foo'].find({"_id":""}).forEach(
function (doc) {
        var docSize = Object.bsonsize(doc);
      	print(doc._id + ' is ' + docSize + ' bytes');
       
    }
)

// 关联查询两个集合的文档
db['foo'].find({bar:{$exists:true}}).forEach(
function (doc) {
        db['nike'].find({name:doc.name}).forEach(
			function (doc) {
        		print('id: ' + doc.id + ', name: ' + doc.name);
    		}
    	)
    }
)

// 查找出foo集合中，bar数组中含有kfc的所有文档
db['foo'].find({bar:'foo'}).forEach(
	function (doc) {
    		print('name: ' + doc.name)
    }
)

// 找出每个表中_id最新的记录
var names=db.getCollectionNames()
for(i=0; i<names.length; i++) {
	db.getCollection(names[i]).find().sort({_id:-1}).limit(1).forEach(
		function (doc) {
			print("{collection: '" + names[i] + "', latestID: '" + doc._id + "'},");
	    }
	)
}

// 把查询结果输出到一个输出界面
function count_foobar() {
    print("count: " + db['foobar'].count({"hello" : "world"}));
}
count_foobar()

db['foobar'].find({"hello" : "world"}).forEach(
    function (doc) {
	db['foobar'].update({"_id" : doc._id}, {$set : {Delta : doc.Sigma - doc.Epsilon}});
	print("Delta: " + (doc.Sigma - doc.Epsilon).toString()); // doc.Sigma & doc.Epsilon 是ISODate类型
    }
)

// a打印出来是arr的下标，但它是字符串类型
for(var a in arr) {
    print(a);
}

// 查找arr1(hello表中)中有但是arr2(foobar表中)中没有的元素
db.hello.find().forEach(
    function (doc) {
        doc.arr.forEach(
            function(item, index) {
                if (db.foobar.count({arr: item}) == 0) {
                    print(item)
                }
            }
        )
    }
)

var arrId = [ObjectId("ffx12")];
arrId.forEach(function(oid) {
	db['foo'].find({"_id":oid}).forEach(
	    function (doc) {
		print('bar: ' + doc.bar);
	})
})

var arrTest=["foobar", "helloworld"]
for (i=0; i<arrTest.length; i++)
{
    x=arrTest[i]
    db['test'].find({"time":{$gt:"yyyy-mm-dd hh:mm:ss"},"name":x}).sort({time:1}).forEach(
    function (doc) {
	print('id: ' + doc.id + ', name: ' + doc.name);
    })
}

var arr=[]
for (i=0; i<arr.length; i++)
{
    foobar=arr[i]
    print('update ' + foobar)
    db['test'].update({foobar:foobar},{$set:{fool:NumberInt(0)}},{multi:true})
}

// 修改数组中字段名，比如将foobar数组中的resultMessage改为resultCode
{
    "foobar" : [
        {
            "resultMessage" : "ILLEGAL"
        }
    ]
}

db.world.find({"foobar.resultMessage" : {$exists:true}}).forEach(
    function (doc) {
      	for (i = 0; i<doc.foobar.length; i++) {
      	    if (doc.foobar[i].resultMessage != null) {
      	  	  resultCode = doc.foobar[i].resultMessage;
      	  	  db.world.update({"_id" : doc._id, "foobar.resultMessage":resultCode, "foobar.resultMessage" : {$exists:true}}, {$set : {"foobar.$.resultCode":resultCode}});
		  db.world.update({"_id" : doc._id, "foobar.resultCode" : resultCode, "foobar.resultMessage" : {$exists:true}}, {$unset : {"foobar.$.resultMessage":true}});
      	    }
      	}
    }
)

// 查出foo+bar字段有重复的记录
db.getCollection('foobar').aggregate([
    { $group: { _id :{foo : "$foo", bar: "$bar"}, count: { $sum : 1 } } },
    { $match: { count: { $gt : 1}}} ]
)

db.test.find({foobar:{$ne:null}, $where:"this.foobar.length > 10 "}) // 查出长度大于10的文档
db.posts.find({post_text:{$regex:"runoob"}})
db.posts.find({post_text:/runoob/})
db.foo.find().sort({bar:-1}).limit(1) // 查出bar最大值
db.foobar.deleteMany({"_id" : {$lt: ObjectId("5899EF000000000000000000")}}) // 删除0x5899EF00 之前的文档
db['foo'].distinct('bar', {time:{$gte:'2006-01-02 15:04:05', $lte:'2007-05-04 15:02:01'}})

db.createRole(role, writeConcern) # 创建自定义角色语法
{
  role: "<name>",
  privileges: [
     { resource: { <resource> }, actions: [ "<action>", ... ] },
     ...
  ],
  roles: [
     { role: "<role>", db: "<database>" } | "<role>",
      ...
  ]}

比如
db.createRole(
{
    "privileges": [
        {
            "actions": [
                "collStats",
                "dbHash",
                "dbStats",
                "find",
                "listIndexes",
                "listCollections",
                "createCollection",
                "createIndex",
                "insert",
                "update",
                "remove",
                "collMod",
                "compact",
                "indexStats",
                "storageDetails",
                "validate",
                "viewUser",
                "top"
            ],
            "resource": {
                "collection": "",
                "db": "dbname"
            }
        }
    ],
    "role": "UserDefdbOwner",
    "roles": []
})

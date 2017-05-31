curl http://127.0.0.1:2379/v2/members
etcdctl member list # 成员列表
curl http://127.0.0.1:2379/v2/stats/leader # 查看leader信息
etcdctl --endpoints http://127.0.0.1:2379  --user root user add admin # 添加一个非特权账号
etcdctl --endpoints http://127.0.0.1:2379  --user root:xxx role grant-permission admin readwrite --prefix /etcd3/foo # 给admin角色添加权限
etcdctl --user root:xxx role grant admin readwrite --prefix /pub/
etcdctl --user root:xxx role revoke admin /pub/ /pub0 # 删除--prefix /pub/权限, revoke不支持--prefix参数
etcdctl --user root:xxx user grant-role admin admin # 给用户分配角色
etcdctl --user root:xxx user revoke-role userA roleA # 删除用户的角色

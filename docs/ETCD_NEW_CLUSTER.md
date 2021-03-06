# ETCD NEW CLUSTER

主要作用部署一个全新的 Etcd Cluster。

## Configure

在 `nodes` 文件中, 主要操作 `[etcd-new-cluster]` 和 `[etcd]` 列表:

```
[etcd-new-cluster]
192.168.122.76
...

```

列表中不要有 Etcd 实例或者数据目录, 避免引起不必要的操作, 可以执行 `remove_etcd_cluster.yml` 初始化后继续执行。

> CA 证书默认是通过 etcd[0] 节点复制过来的, 不会重新生成, 如果重新生成则会引起不必要的服务异常。

> 如果要新建 CA 则修改 `roles/etcd-cluster-management/defaults/etcd-new-cluster.yaml` 中 `ca_new` 为 `true` 即可。新建 CA 需要手动更新 Network 等需要连接 Etcd 的配置项。

## 执行

上述配置准备好后准备执行命令:

```
$ make run_etcd_new
```

## 检测

检车 etcd 列表时, 会发现多出的 etcd cluster 服务:

```
kube-system   etcd-master01.local                       1/1     Running   0          18h   192.168.122.86    master01.local   <none>           <none>
kube-system   etcd-master02.local                       1/1     Running   1          19h   192.168.122.120   master02.local   <none>           <none>
kube-system   etcd-master03.local                       1/1     Running   1          19h   192.168.122.108   master03.local   <none>           <none>
kube-system   etcd-master04.local                       1/1     Running   0           1h   192.168.122.76    master04.local   <none>           <none>
kube-system   etcd-master05.local                       1/1     Running   0           1h   192.168.122.19    master05.local   <none>           <none>
kube-system   etcd-master06.local                       1/1     Running   0           1h   192.168.122.220   master06.local   <none>           <none>
...
```
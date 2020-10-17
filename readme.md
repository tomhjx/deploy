```seq

participant ecs as 发版机
participant gitlab as gitlab
participant docker_hub as hub.docker.com
participant ali_hub as 阿里云私有镜像仓库
participant ali_k8s as 阿里云k8s

ecs->>gitlab:git pull/clone 源码
ecs->>gitlab:git checkout 最新tag
ecs->>gitlab:git pull/clone deploy.xxx.git
ecs->>ecs:拷贝源码到deploy.xxx.git/src
ecs->>ecs:docker build
ecs->>docker_hub:From 基础镜像
ecs->>ali_hub:docker push
ecs->>ali_k8s:kubectl apply -f config（更新k8s服务）


```
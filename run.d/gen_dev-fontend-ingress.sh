#!/bin/bash

#---------
# 生成研发环境的k8s ingress配置内容
#
#---------

span="
    - host: stage1-yeebia-app.xgo.city\n
      http:\n
        paths:\n
        - backend:\n
            serviceName: feproxy\n
            servicePort: 80\n
          path: /\n
";

echo $span
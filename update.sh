#!/bin/bash

## 导入通用变量与函数

function Git_PullShell {
  git config --global http.version HTTP/1.1
  echo -e "更新shell脚本\n"
  cd /pagermaid/workdir/utils/diy
  git fetch --all
  ExitStatusShell=$?
  git reset --hard origin/PagerMaid-Pyro
}

#临时更新
function temporary {
  source /pagermaid/workdir/utils/diy/uptemp.sh
}

echo "开始运行"
Git_PullShell
temporary
echo "运行结束，退出"
exit

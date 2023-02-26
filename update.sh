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

function Git_PullShell_start {
  Git_PullShell
  if [ $ExitStatusShell = 0 ]; then
    echo "更新成功"
    temporary
  else
    x=1
    while [[ x -le 3 ]]; do
      echo "更新失败，重试第$x次"
      Git_PullShell
      if [ $ExitStatusShell = 0 ]; then
        echo "更新成功"
        temporary
        return
      else
        let x++
      fi
    done
    echo "完全失败了，艹，退出"
    exit
  fi
    
}

#临时更新
function temporary {
  source /pagermaid/workdir/utils/diy/uptemp.sh
}

echo "开始运行"
Git_PullShell
echo "运行结束，退出"
exit

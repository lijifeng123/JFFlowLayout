#!/bin/bash

git add --all

git commit -m "提交代码"

echo "请选择要提交的分支"

echo "1 - master"

echo "2 - develop"

read describe

tempbarch="develop"

if [ $describe == 1 ]
then
tempbarch="master"
fi

git pull origin $tempbarch

git push origin $tempbarch

git push origin --delete tag 1.1.1

git tag -d 1.1.1

git tag "1.1.1"

git push --tag

pod spec lint JFFlowLayout.podspec --verbose --allow-warnings

pod trunk push JFFlowLayout.podspec --verbose --allow-warnings

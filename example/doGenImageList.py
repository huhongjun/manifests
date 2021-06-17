#!/bin/python
#coding:utf-8
import os
import subprocess
import sys
import time
from replace import findDeploymentImage,logAndPushImage

def doReplace(path):

    imagelist = []

    for root,path,files in os.walk(path):
        for f in files:
            filename = root + "/" + f 
            print(filename)
            with open(filename, "r", encoding="utf-8") as fw:
                cont = fw.read()
                # print(cont)
                imageMap = findDeploymentImage(cont)
                print(imageMap)
                imagelist.append(imageMap)

    with open("images.log","w+") as fw:
        for imageMap in imagelist:
            for image in imageMap:
                # line = image + "\t" + imageMap[image]
                line = imageMap[image]
                fw.write(line+"\n")                    

if __name__ == "__main__":

    path = "./file"
    doReplace(path)
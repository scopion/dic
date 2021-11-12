#coding=utf-8
  
import sys, re, os

def file_merge():
    input_path = "./" #此处填好自己的路径，注意最后的"/"

    #使用os.listdir函数获取路径下的所有的文件名，并存在一个list中
    #使用os.path.join函数，将文件名和路径拼成绝对路径
    whole_file = [os.path.join(input_path,file) for file in os.listdir(input_path)]
    content = []
    #对于每一个路径，将其打开之后，使用readlines获取全部内容
    for w in whole_file:
        with open(w,'rb') as f:
            content = content+f.readlines()
            

    #构造输出的路径，和输入路径在同一个文件夹下，如果该文件夹内没有这个文件会自动创建
    output_path = os.path.join(input_path,'all.txt')
    #将内容写入文件
    with open(output_path,'wb') as f:
        f.writelines(content)
  
def getDictList(dict):
    regx = '''[\w\~`\!\@\#\$\%\^\&\*\(\)\_\-\+\=\[\]\{\}\:\;\,\.\/\<\>\?]+'''
    with open(dict) as f:
        data = f.read()
        return re.findall(regx, data)
  
def rmdp(dictList):
    return list(set(dictList))
  
def fileSave(dictRmdp, out):
    with open(out, 'a') as f:
        for line in dictRmdp:
            if len(line)<=16:
                f.write(line + '\n')
  
def main():
    try:
        dict = 'all.txt'
        out = 'all-ok.txt'
    except Exception, e:
        print 'error:', e
        me = os.path.basename(__file__)
        exit()
  
    dictList = getDictList(dict)
    dictRmdp = rmdp(dictList)
    fileSave(dictRmdp, out)
    
if __name__ == '__main__':
    file_merge()
    main()
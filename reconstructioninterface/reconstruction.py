"""
作者：Wanghao
日期：2020年11月19日
"""

import matlab.engine
import numpy as np
from tkinter import *

root = Tk()
root.title("图像重建")
root.geometry("600x230")


eng1 = matlab.engine.start_matlab()
eng2 = matlab.engine.start_matlab()
eng3 = matlab.engine.start_matlab()


def Import():
    a=np.loadtxt("training dataCSV1.csv", dtype=np.float, delimiter=',', unpack=False)
    lab2.config(text=a.shape)
    b= np.loadtxt("training dataCSV2.csv", dtype=np.float, delimiter=',', unpack=False)
    lab4.config(text=b.shape)
    c = np.loadtxt("test dataCSV1.csv", dtype=np.float, delimiter=',', unpack=False)
    lab6.config(text=c.shape)
    d = np.loadtxt('test dataCSV2.csv', dtype=np.float, delimiter=',', unpack=False)
    lab8.config(text=d.shape)


def ENG1():
    eng1.RBFnet(nargout=0)
    input("press enter to continue...")
    # while eng1.isvalid():
    #     pass
    eng1.quit()


def ENG2():
    eng2.predict(nargout=0)
    input("press enter to continue...")
    eng2.quit()


def ENG3():
    eng3.code02(nargout=0)
    input("press enter to continue...")
    eng3.quit()


btn1 = Button(root, text="导入数据", font=('Arial', 12), width=15,
              height=2, command=Import)
btn1.place(x=10, y=10)

lab1 = Label(root,text="样本训练数据：", font=('Arial', 12), width=15,height=2)
lab1.place(x=200,y=10)

lab2 = Label(root,relief="groove", font=('Arial', 12), width=15,height=2)
lab2.place(x=350,y=10)

lab3 = Label(root,text="样本训练标签：", font=('Arial', 12), width=15,height=2)
lab3.place(x=200,y=60)

lab4 = Label(root,relief="groove", font=('Arial', 12), width=15,height=2)
lab4.place(x=350,y=60)

lab5 = Label(root,text="样本测试数据：", font=('Arial', 12), width=15,height=2)
lab5.place(x=200,y=110)

lab6 = Label(root,relief="groove", font=('Arial', 12), width=15,height=2)
lab6.place(x=350,y=110)

lab7= Label(root,text="样本测试标签：", font=('Arial', 12), width=15,height=2)
lab7.place(x=200,y=160)

lab8 = Label(root,relief="groove", font=('Arial', 12), width=15,height=2)
lab8.place(x=350,y=160)

btn2 = Button(root, text="训练模型", font=('Arial', 12), width=15,
              height=2, command=ENG1)
btn2.place(x=10, y=60)

btn3 = Button(root, text="测试模型", font=('Arial', 12), width=15,
              height=2, command=ENG2)
btn3.place(x=10, y=110)

btn3 = Button(root, text="图像重建", font=('Arial', 12), width=15,
              height=2, command=ENG3)
btn3.place(x=10, y=160)

root.mainloop()

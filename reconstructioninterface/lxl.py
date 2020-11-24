"""
作者：Wanghao
日期：2020年11月18日
"""
import matlab.engine

eng = matlab.engine.start_matlab()

eng.plot1(nargout=0)

eng.quit()


#如果想改变nargout=0输出的个数，可以将脚本定义成一个函数，然后调用这个函数
# #This example shows how to call the MATLAB® sqrt function asynchronously from Python® and retrieve the square root later.
#
# The engine calls MATLAB functions synchronously by default. Control returns to Python only when the MATLAB function finishes. But the engine also can call functions asynchronously. Control immediately returns to Python while MATLAB is still executing the function. The engine stores the result in a Python variable that can be inspected after the function finishes.
#
# Use the background argument to call a MATLAB function asynchronously.
#
# import matlab.engine
# eng = matlab.engine.start_matlab()
# future = eng.sqrt(4.0,background=True)
# ret = future.result()
# print(ret)
# 2.0
# Use the done method to check if an asynchronous call finished.
#
# tf = future.done()
# print(tf)
# True
# To stop execution of the function before it finishes, call future.cancel().




# Call User Scripts and Functions from Python
# This example shows how to call a MATLAB® script to compute the area of a triangle from Python®.
#
# In your current folder, create a MATLAB script in a file named triarea.m.
#
# b = 5;
# h = 3;
# a = 0.5*(b.* h)
# After you save the file, start Python and call the script.
#
# import matlab.engine
# eng = matlab.engine.start_matlab()
# eng.triarea(nargout=0)
# a =
#
#     7.5000
#
# Specify nargout=0. Although the script prints output, it returns no output arguments to Python.
#
# Convert the script to a function and call the function from the engine. To edit the file, open the MATLAB editor.
#
# eng.edit('triarea',nargout=0)
# Delete the three statements. Then add a function declaration and save the file.
#
# function a = triarea(b,h)
# a = 0.5*(b.* h);
# Call the new triarea function from the engine.
#
# ret = eng.triarea(1.0,5.0)
# print(ret)
# 2.5
# The triarea function returns only one output argument, so there is no need to specify nargout.
#
# See Also
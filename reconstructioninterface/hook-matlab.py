"""
作者：Wanghao
日期：2020年11月20日
"""
from PyInstaller.utils.hooks import collect_all

datas, binaries, hiddenimports = collect_all('matlab')
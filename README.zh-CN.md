# Web Notes Lisp

一个用`Common Lisp`编写的Web记录应用，可以创建、检索、删除记录，并且可以持久化数据。

## 开发

- [sbcl](http://www.sbcl.org/) 是一个高性能的 Common Lisp **编译器**.
- [quicklisp](https://www.quicklisp.org/beta/) 是 Common Lisp 的库管理器。它可以**自动**下载加载系统所需的任何支持软件。

安装好上述软件并配置好环境后，就可以用下面的命令开始玩耍了。

```shell
# you need to install `sbcl` and `quicklisp` first
sbcl --load app.lisp

# output: 
# ready - started server on 0.0.0.0:3000, url: http://localhost:3000
# info  - site root at ./www/, data store at ./storage-temp/
```

## 为什么

- 函数式编程很棒，lambda很优雅。
- 如果找到一个`js`库，最后更新日期是`2018`，那么这个库几乎没法用，但是如果它是一个`lisp lib`，即使它是在`1998`更新的，改改也可以用.

## 参考

- [About - Steel Bank Common Lisp](http://www.sbcl.org/)
- [Quicklisp beta](https://www.quicklisp.org/beta/)
- [Hunchentoot - The Common Lisp web server formerly known as TBNL](https://edicl.github.io/hunchentoot/)
- [CL-JSON](https://cl-json.common-lisp.dev/cl-json.html)
- [CL-PREVALENCE](https://cl-prevalence.common-lisp.dev/)
- [Lisp for The Modern Web](https://vitovan.com/lispweb3.html)

## Licnese

MIT
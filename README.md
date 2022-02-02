# Web Notes Lisp

[中文版本](README.zh-CN.md)

A web note-taking application written in `Common Lisp` that can create, retrieve, delete notes, and persist data.

## Dev

- [sbcl](http://www.sbcl.org/) is a high performance Common Lisp **compiler**.
- [quicklisp](https://www.quicklisp.org/beta/) is a library manager for Common Lisp.It can **automatically** download any supporting software it needs to load the system.

Once the above software is installed and set up correctly, you can start it with the following command.

```shell
# you need to install `sbcl` and `quicklisp` first
sbcl --load app.lisp

# output: 
# ready - started server on 0.0.0.0:3000, url: http://localhost:3000
# info  - site root at ./www/, data store at ./storage-temp/
```

## Why

- Functional programming is wonderful, lambdas are elegant.
- If you see that the last update date of a `js lib` is `2018`, then the library cannot be used, but if it is a `lisp lib`, it can be used even if it was updated in `1998`.

## REF

- [About - Steel Bank Common Lisp](http://www.sbcl.org/)
- [Quicklisp beta](https://www.quicklisp.org/beta/)
- [Hunchentoot - The Common Lisp web server formerly known as TBNL](https://edicl.github.io/hunchentoot/)
- [CL-JSON](https://cl-json.common-lisp.dev/cl-json.html)
- [CL-PREVALENCE](https://cl-prevalence.common-lisp.dev/)
- [Lisp for The Modern Web](https://vitovan.com/lispweb3.html)

## Licnese

MIT
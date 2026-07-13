## error-01

```less
go build -trimpath "-buildmode=pie"  -tags "seccomp libpathrs " -ldflags "-X main.gitCommit=v1.5.0-rc.1-191-gfc89fbd9  " -o runc .
# cyphar.com/go-pathrs/internal/libpathrs
# [pkg-config --cflags  -- pathrs]
Package pathrs was not found in the pkg-config search path.
Perhaps you should add the directory containing `pathrs.pc'
to the PKG_CONFIG_PATH environment variable
Package 'pathrs' not found
make: *** [Makefile:85: runc-bin] Error 1
```

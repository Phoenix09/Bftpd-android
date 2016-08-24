# Bftpd for Android

## Compiling
```shell
$ ./build.sh <ARCH>
```

## Running
1. Push bftpd directory to `/data/local`
2. Edit `bftpd.conf` as required  
    Users are specified in `/data/local/bftpd/ftpdpasswd`  
    In the format `user password group home`  
3. Run with `./bftpd -d`


### To Do
- [ ] Use `crypt()` for passwords

# Bftpd for Android

## Compiling
./build.sh &lt;ARCH&gt;

## Running
1. Push bftpd directory to `/data/local`
2. Edit `bftpd.conf` as required  
    Users are specified in `/data/local/bftpd/ftppasswd`  
    In the format `user password group home`  
3. Run with `./bftpd -d


### To Do
- [ ] Use `crypt()` for passwords

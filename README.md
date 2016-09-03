# Bftpd for Android

## Compiling
```shell
$ ./build.sh <ARCH>
```

## Running
1. Push bftpd directory to `/data/local`
2. Edit `bftpd.conf` as required  
    Users are specified in `/data/local/bftpd/ftpdpassword`  
```
  # The format of this file is as shown below:
  # username crypt_password group home_folder
  # (for example:)
  # These use a password of "test"
  # robert $5$ZxTp9Xfue11F$.Qqr.oUcLVltmfUolkt6Ba9IUZkdhu0pS2EhtyyFjI0 users /home/robert
  # james $5$ZxTp9Xfue11F$.Qqr.oUcLVltmfUolkt6Ba9IUZkdhu0pS2EhtyyFjI0 users /mnt/storage
  #
  # You can generate the crypt password with: mkpasswd -mSHA-256
  # Will prompt for password and display the encrypted password
  #
  # A entry with the password field set to * (star) requires
  # no password. Any password the users enters will be accepted.
  # The following example is for a user with no password.
  # anyone * users /home/ftp
```
3. Run with `./bftpd -d`

#define PATH_BFTPD_CONF "/data/local/bftpd/bftpd.conf"
#ifdef PREFIX
#define PATH_BFTPD_CONF_WITH_PREFIX PREFIX"/data/local/bftpd/bftpd.conf"
#endif
#define PATH_STATUSLOG "/dev/null"
#undef HAVE_UTMP_H
#undef HAVE_SHADOW_H
